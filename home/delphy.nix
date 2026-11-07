{ inputs, pkgs, ... }:

{
  home.username = "delphy";
  home.homeDirectory = "/home/delphy";

  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.zen-browser.homeModules.beta
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ./nixvim
  ];

  home.sessionPath = [
    "$HOME/.npm-global/bin"
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];

    config = {
      common = {
        default = [
          "gnome"
          "gtk"
        ];
      };
    };
  };

  # Declarative Flatpaks (Flathub remote is added by default)
  services.flatpak = {
    packages = [
      "org.onlyoffice.desktopeditors"
    ];
    update.auto.enable = true;
  };

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };
  # Shell
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    initContent = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };

  home.packages = with pkgs; [
    discord
    spotify
    obs-studio
    prismlauncher
    gh
    kdePackages.ark
    filezilla
    chromium
    winetricks
    distrobox
    zoom-us
    faugus-launcher
    openrct2
    teams-for-linux
    foliate
    appimage-run
    thunderbird
    snes9x
    nicotine-plus
    antigravity-ide
    unrar
    wl-mirror
    mangohud
    vulkan-tools
    inputs.artcraft.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  home.stateVersion = "26.05";
}
