{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];
  # Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;
  # Boot
  boot.loader = {
    efi.canTouchEfiVariables = true;
    
    limine = {
      enable = true;
      secureBoot.enable = true;
      extraEntries = ''
        /Windows
    protocol: efi
    path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
    '';
    };
  };
  
  boot.extraModulePackages = [
    config.boot.kernelPackages.evdi
  ];

  boot.kernelModules = [ "evdi" ];
  boot.extraModprobeConfig = ''options evdi initial_device_count=1'';

  time.hardwareClockInLocalTime = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  nixpkgs.config.allowUnfree = true;


  # Networking
  networking.hostName = "nix";
  networking.networkmanager.enable = true;
  
  programs.nix-ld.enable = true;

  # Keyboard
  services.xserver = {
    xkb.layout = "us,ru";
    xkb.options = "grp:alt_shift_toggle";
  };

  # Time / Locale
  time.timeZone = "Asia/Almaty";

  i18n.defaultLocale = "en_US.UTF-8";

  # Nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  
  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  # User
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
  # Hardware

  hardware.cpu.intel.updateMicrocode = true;

  services.fprintd.enable = true;

  services.power-profiles-daemon.enable = true;

  # Audio

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  security.rtkit.enable = true;

  # Graphics

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Flatpak

  services.flatpak.enable = true;

  # Docker

  virtualisation.docker.enable = true;

  # Steam

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
  
  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };

  # KDE Connect

  programs.kdeconnect.enable = true;

  # Waydroid
  virtualisation.waydroid.enable = true;
  virtualisation.waydroid.package = pkgs.waydroid-nftables;

  # Core Packages
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  environment.systemPackages = with pkgs; [
    kitty
    git
    wl-clipboard

    fastfetch
    btop
    tree
    wget
    curl
    unzip
    obsidian

    nautilus
    docker-compose

    nodejs_24

    ffmpeg
    mpv
    vlc

    pavucontrol
    lm_sensors

    qbittorrent

    telegram-desktop

    rclone
    powertop
    pciutils
    usbutils

    wireguard-tools
    proton-vpn

    lsfg-vk
    lsfg-vk-ui

    sbsigntool
    mokutil
    efitools
    sbctl

    xwayland-satellite
    wineWow64Packages.stable
  ];

  # Services

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true; 
  # Niri + DMS
  programs.niri.enable = true;
  programs.dux-shell = {
    enable = true;

    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
    };
  
  };
  programs.xwayland.enable = true;
  services.upower.enable = true; # Battery detection
  
  # Firewall

  networking.firewall.enable = true;

  # Firmware updates (LVFS)
  services.fwupd.enable = true;

  # Intel Things
  services.thermald.enable = true;

  # TRIM
  services.fstrim.enable = true;
  
  # Gamemode
  programs.gamemode.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  

  # VPN thing
  networking.firewall.checkReversePath = "loose";
  
  # State Version
  system.stateVersion = "26.05";
}
