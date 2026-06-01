{ pkgs, ... }:

{
  home.username = "delphy";
  home.homeDirectory = "/home/delphy";

  programs.home-manager.enable = true;
  
  # Shell
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
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
  ];
  home.stateVersion = "26.05";
}
