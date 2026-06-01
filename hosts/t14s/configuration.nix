{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  ################################
  # Boot
  ################################

  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  nixpkgs.config.allowUnfree = true;
  ################################
  # Networking
  ################################

  networking.hostName = "nix";
  networking.networkmanager.enable = true;
  

  # Keyboard
  services.xserver = {
    xkb.layout = "us,ru";
    xkb.options = "grp:alt_shift_toggle";
  };

  ################################
  # Time / Locale
  ################################

  time.timeZone = "Asia/Almaty";

  i18n.defaultLocale = "en_US.UTF-8";

  ################################
  # Nix
  ################################

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  ################################
  # User
  ################################

  users.users.delphy = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "video"
      "audio"
    ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
  ################################
  # Hardware
  ################################

  hardware.cpu.intel.updateMicrocode = true;

  services.fprintd.enable = true;

  services.power-profiles-daemon.enable = true;

  ################################
  # Audio
  ################################

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  security.rtkit.enable = true;

  ################################
  # Graphics
  ################################

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  ################################
  # Flatpak
  ################################

  services.flatpak.enable = false;

  ################################
  # Docker
  ################################

  virtualisation.docker.enable = true;

  ################################
  # Steam
  ################################

  programs.steam = {
    enable = true;
  };

  ################################
  # KDE Connect
  ################################

  programs.kdeconnect.enable = true;

  ################################
  # Waydroid
  ################################

  virtualisation.waydroid.enable = true;

  ################################
  # Core Packages
  ################################

  environment.systemPackages = with pkgs; [
    firefox
    kitty
    git
    gh
    distrobox

    neovim
    fastfetch
    btop
    tree
    wget
    curl
    unzip
    
    nautilus
    docker-compose

    gcc
    cmake
    ninja
    pkg-config

    nodejs_24
    python3

    ffmpeg
    mpv
    vlc

    pavucontrol
    lm_sensors

    mangohud
    vulkan-tools

    qbittorrent

    obs-studio
    onlyoffice-desktopeditors

    telegram-desktop
    
    rclone
    upower
    powertop
    pciutils
    usbutils
    
    vulkan-tools
    mangohud
    gamemode

    xwayland-satellite
    wineWow64Packages.stable
  ];

  ################################
  # Services
  ################################

  services.openssh.enable = true;
  

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  
  # Niri + DMS
  programs.niri.enable = true;
  programs.dms-shell = {
    enable = true;

    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
    };
  
    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableClipboardPaste = true;       # Pasting from the clipboard history (wtype)
  };
  programs.xwayland.enable = true;
  services.upower.enable = true; # Battery detection
  ################################
  # Firewall
  ################################

  networking.firewall.enable = true;

  # Intel Things
  services.thermald.enable = true;

  # TRIM
  services.fstrim.enable = true;
  
  # Gamemode
  programs.gamemode.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;


  # State Version
  system.stateVersion = "26.05";
}
