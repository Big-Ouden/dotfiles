# Dotfiles

## Requirement

- alacritty (OpenGL terminal emulator)
- betterlockscreen (lock screen)
- btop (interactive process viewer)
- calcurse (terminal-based organizer)
- dunst (notificaiton-daemon)
- geany (small and lightweight IDE)
- hyprland (Dynamic tiling Wayland compositor)
- i3 (dynamic tiling window manager)
- neofetch (CLI system information tool)
- nvim (text editor)
- ranger (cli visual file manager)
- rofi (X11 pop-up window manager)
- Thunar (File Manager for the Xfce Desktop Environment)
- viewnior (simple & fast image viewer)
- zathura (document viewer)
- zsh (UNIX command interpreter (shell))
- stow (symlink farmer manager)

### Requirement installation

- pacman (Arch)

```sh
sudo pacman -Syy alacritty betterlockscreen btop calcurse dunst geany hyprland i3 neofetch nvim ranger rofi Thunar viewnior zathura zsh stow
```

- apt (debian)

```sh
sudo apt update
sudo apt install alacritty betterlockscreen btop calcurse dunst geany hyprland i3 neofetch nvim ranger rofi Thunar viewnior zathura zsh stow
```

### Contexte

J'utilise [stow](https://www.gnu.org/software/stow/manual/stow.html) qui est un "symlink farm manager" qui permet de creer des symlink entre les fichiers de configuration dans les dossiers usuels du type .config/ .zshrc.

Arborescence du projet :

dotfiles/
├── config
│   ├── dot-config
│   ├── dot-fehbg
│   ├── dot-oh-my-zsh
│   └── dot-zshrc -> dot-config/zsh/zshrc
├── README.md
├── scripts
│   ├── change_background.sh
│   └── stow.sh
└── wallpaper
├── aesthetic-wallpapers
├── chosen_background
└── walls
