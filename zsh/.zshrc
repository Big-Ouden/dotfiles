# End of lines configured by zsh-newuser-install
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"

#get the directory where this file is located
#_custom_zsh_config_base="${${(%):-%x}:A:h}"
_custom_zsh_config_base="/home/simon/.config/zsh"


#load all our config files
for file ($_custom_zsh_config_base/*.zsh); do
	source $file
done


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi
# Source the Lazyman shell initialization for aliases and nvims selector
# shellcheck source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
# Source the Lazyman .nvimsbind for nvims key binding
# shellcheck source=.config/nvim-Lazyman/.nvimsbind
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind
# Luarocks bin path
[ -d ${HOME}/.luarocks/bin ] && {
  export PATH="${HOME}/.luarocks/bin${PATH:+:${PATH}}"
}
