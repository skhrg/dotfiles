{ config, pkgs, ... }:

{
  home.username = "lordskh";
  home.homeDirectory = "/home/lordskh";

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    neofetch
    nnn
    neovim
    starship
    glow
    kitty

    # media
    mpd
    ncmpcpp
    mpv
    zathura
    sxiv
    
    # utils
    ripgrep
    eza
    fzf

    # nix related
    nix-output-monitor
  ];

  home.stateVersion = "25.11";
}
