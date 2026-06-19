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
  home.packages = with pkgs; [
    zsh-powerlevel10k
    discord-ptb
    cider-2
    obs-studio
    prismlauncher
  ];
  home.stateVersion = "26.05";
}
