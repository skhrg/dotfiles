# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # imports =
  #   [ # Include the results of the hardware scan.
  #     ./hardware-configuration.nix
  #   ];

  system.stateVersion = "26.05";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # udisks
  services.udisks2.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lordskh = {
    isNormalUser = true;
    description = "lordskh";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  # Core things
  zsh
  git
  vim
  keyd
  syncthing
  killall
  chromium
  # Archiving
  zip
  xz
  unzip
  p7zip
  # Networking
  mtr
  iperf3
  dnsutils
  socat
  arp-scan
  nmap
  networkmanagerapplet
  # Utils
  xev
  wget
  file
  tree
  gnupg
  tmux
  ffmpeg
  yazi
  # Monitoring
  strace
  ltrace
  lsof
  btop
  iotop
  iftop
  powertop
  # Systools
  sysstat
  lm_sensors
  ethtool
  pciutils
  usbutils
  # Desktop
  grim
  slurp
  wl-clipboard
  dunst
  pwvucontrol
  ];
  # Set the default editor to vim
  environment.variables.EDITOR = "vim";
  
  # Enable Zsh program features and add to system's available shells
  programs.zsh.enable = true;

  # Set Zsh as the default shell for all users
  users.defaultUserShell = pkgs.zsh;

  # Ensure the zsh path is included in /etc/shells for compatibility
  environment.shells = with pkgs; [ zsh bash ];

  # Enable the gnome-keyring secrets vault. 
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;

  # enable Sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  programs.waybar.enable = true;

  # Greeter
  services.greetd = {                                                      
    enable = true;                                                         
    settings = {                                                           
      default_session = {                                                  
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";                                                  
      };                                                                   
    };                                                                     
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
    wlr.enable = true;
  };
  xdg.mime.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
  };

  # Fonts
  fonts = {
    fontconfig.enable = true; # Essential for font management
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans # For CJK characters
      fira-code
      noto-fonts-color-emoji
      fira-code-symbols
      liberation_ttf
      source-code-pro
      cascadia-code
    ];
  };

  # Enable nix-ld
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libGL
    libglvnd
    libxkbcommon
    wayland
  
    stdenv.cc.cc.lib
  
    glib
    dbus
    zlib
    zstd
    fontconfig
    freetype
  
    xorg.libX11
    xorg.libXext
    xorg.libXrender
    xorg.libxcb
    xorg.libXrandr
    xorg.libXi
    xorg.libXcursor
    xorg.libXfixes
    xorg.libXinerama
    xorg.libXcomposite
    xorg.libXdamage
    xorg.xcbutilcursor
    xorg.xcbutilkeysyms
    xorg.xcbutilrenderutil
  ];

 services.udev.extraRules = ''
  SUBSYSTEM=="usb", ATTR{idVendor}=="2972", ATTR{idProduct}=="0147", TAG+="uaccess", MODE="0666"

  SUBSYSTEM=="hidraw", ATTRS{idVendor}=="2972", ATTRS{idProduct}=="0147", TAG+="uaccess", MODE="0666"
'';


}

