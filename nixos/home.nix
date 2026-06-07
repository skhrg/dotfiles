{ config, pkgs, ... }:

{
  home.username = "lordskh";
  home.homeDirectory = "/home/lordskh";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  };

  services.mpd = {
    enable = true;
    musicDirectory = "/home/lordskh/Music";
    network.startWhenNeeded = true;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    neofetch
    nnn
    neovim
    starship
    glow
    kitty
    nodejs
    oh-my-zsh
    rofi
    libreoffice-still
    hunspell
    hunspellDicts.en_US
    uv
    freecad
    qt6.full

    # typesetting 
    pandoc
    texlive.combined.scheme-full
    
    # comms
    signal-desktop
    slack
    remmina

    # media
    mpd
    mpc
    ncmpcpp
    mpv
    zathura
    sxiv
    cava
    
    # utils
    ripgrep
    eza
    fzf
    zoxide
    bat
    ripgrep-all
    wine

    # nix related
    nix-output-monitor

    # Fonts
    lohit-fonts.telugu
    lohit-fonts.tamil
  ];

  # We do everything with symlinks here so that my non nix systems can use the same files
  home.file = {
    # vim and nvim stuff
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.config/nvim";
    };
    ".vimrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.config/nvim/vimrc";
    };
    ".config/coc" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.config/coc";
    };
    # Git stuff
    ".gitignore_global" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.gitignore_global";
    };
    ".gitconfig" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.gitconfig";
    };
    # ssh
    ".ssh/config" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.ssh/config";
    };
    # zsh
    ".zshrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.zshrc";
    };
    ".aliases" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.aliases";
    };
    ".exports" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.exports";
    };
    ".fontscripts" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.fontscripts";
    };
    # Dev 
    ".tmux.conf" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.tmux.conf";
    };
    ".config/ipython/profile_default/startup" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.config/ipython/profile_default/startup";
    };
    ".config/flake8" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.config/flake8";
    };
    # Customization
    ".Xresources" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.Xresources";
    };
    ".config/starship.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.config/starship.toml";
    };
    ".config/kitty" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.config/kitty";
    };
    # Application files
    ".local/share/applications/nnn.desktop" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.local/share/applications/nnn.desktop";
    };
    ".local/share/applications/vim.desktop" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.local/share/applications/vim.desktop";
    };
    # Media
    ".config/mpd" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.config/mpd";
    };
    ".config/ncmpcpp" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.config/ncmpcpp";
    };
    ".config/mpv" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.config/mpv";
    };
    ".config/zathura" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.config/zathura";
    };
    # sway 
    ".config/sway/config" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.config/sway/laptop_config";
    };
    ".config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.config/waybar";
    };
    ".config/dunst" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/dotfiles/.config/dunst";
    };
    # scripts
    ".local/bin/nwrap" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/scripts/nwrap";
    };
    ".local/bin/tmux_nnn" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/scripts/tmux_nnn";
    };
    ".local/bin/square" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/scripts/square";
    };
    ".local/bin/askpass" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/scripts/askpass";
    };
    ".local/bin/ssh-add-all" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Projects/scripts/ssh-add-all";
    };
  };
}
