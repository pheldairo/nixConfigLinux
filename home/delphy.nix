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

    initContent = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
  
      if [[ -f ~/.p10k.zsh ]]; then
        source ~/.p10k.zsh
      fi
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
  ];
  home.stateVersion = "26.05";
}
