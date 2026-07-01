{ pkgs, config, nixvim, ... }:

{
  home.username = "delphy";
  home.homeDirectory = "/home/delphy";

  imports = [
    nixvim.homeModules.nixvim

    ./nixvim
  ];

  programs.home-manager.enable = true;


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
    initExtra = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };

  programs.kitty.settings = {
    window_padding_width = 0;
    window_margin_width = 0;
    single_window_margin_width = 0;
    cursor_trail = 1;
    cursor_trail_decay = "0.1 0.4";
    cursor_trail_start_threshold = 2;
  };

  home.packages = with pkgs; [
    zsh-powerlevel10k
    discord-ptb
    cider-2
    obs-studio
    prismlauncher
    gh
    lutris
    kdePackages.ark
  ];
  home.stateVersion = "26.05";
}
