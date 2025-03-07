#!/bin/bash

# index of the displayed task
index=1
# countdown to the next forced update
dirty_countdown=0
# period of the forced update (in seconds)
reload_rate=10
# is the module in the period of confirmation for marking a task as done
# if so, clicking will cancel marking
marking=0

while getopts ":r:f:" opt; do
    case $opt in
    r)
        reload_rate="$OPTARG"
        ;;
    f)
        filter="$OPTARG"
        ;;
    \?)
        echo "Invalid option -$OPTARG" >&2
        ;;
    esac
done

# echo the task with the specified id
echo_task() {
    descriptions=$(task $filter rc.verbose: rc.report.minimal.columns:description.count rc.report.minimal.sort=id rc.report.minimal.labels:1 minimal)
    count=$(echo "${descriptions}" | wc -l)
    if [ $count -gt 0 ]; then
        index=$(((index - 1) % count + 1))
    else
        index=-1
    fi
    current_desc=$(echo "${descriptions}" | sed -n $((index))p)
    current_due=$(task $filter rc.verbose: rc.report.minimal.columns:id,due.relative rc.report.minimal.sort=id rc.report.minimal.labels:1,1 minimal | sed -e "s/^[[:digit:]]\+$//" -e "s/^[[:digit:]]\+\s\+//" | sed -n $((index))p)
    echo "$index" >/tmp/tw_polybar_id
    if [ -z "$current_due" ]; then
        echo " $index $current_desc"
    else
        echo " $index$current_desc ·  $current_due"
    fi
}
# mark task as done
mark_done() {
    marking=1
    echo Marking as done...
    sleep 2 &
    wait
    if [ $marking -ne 1 ]; then return; fi
    task "$(($(cat /tmp/tw_polybar_id)))" done >/dev/null
    echo_task
    marking=0
}
cancel_marking() {
    marking=0
    echo Canceled!
    sleep 1 &
    wait
    echo_task
}
click1() {
    if [ $marking -eq 0 ]; then
        # increment $index and display next task
        ((index++))
        echo_task

    else
        cancel_marking
    fi
}
click2() {
    if [ $marking -eq 0 ]; then
        mark_done
    else
        cancel_marking
    fi
}

trap "click1" USR1
trap "click2" USR2

# echo our pid for debugging
echo $$
echo_task
while true; do
    # do a forced update every $dirty_countdown_max
    if [ $marking -eq 0 ]; then
        dirty_countdown=$(((dirty_countdown + 1) % $reload_rate))
        if [ $dirty_countdown -eq 0 ]; then
            # ((index++))
            echo_task
        fi
    fi
    # # echo the displayed task when dirty
    # if [ $dirty -ne 0 ]
    # then
    # 	if [ $index -eq "-1" ]; then
    # 		echo no task
    # 	else
    # 		echo_task $index
    # 	fi
    # 	dirty=0
    # 	dirty_countdown=0
    # fi
    sleep 1 &
    wait
done
