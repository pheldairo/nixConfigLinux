{ pkgs, ... }:

{
  programs.nixvim.plugins = {
    telescope.enable = true;
    neo-tree.enable = true;
    treesitter = {
      enable = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        nix
        rust
        lua
        bash
        json
        yaml
        toml
        markdown
        python
        cpp
      ];
    };
    lualine.enable = true;
    gitsigns.enable = true;
    which-key.enable = true;
    comment.enable = true;
    snacks = {
      enable = true;
      settings = {
        terminal.enabled = true;
      };
    };
    copilot-lua.enable = true;
    cord.enable = true;
    lazygit.enable = true;
    web-devicons.enable = true;
  };
}
