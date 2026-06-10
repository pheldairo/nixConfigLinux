{
  programs.nixvim.plugins = {
    telescope.enable = true;
    neo-tree.enable = true;
    treesitter.enable = true;
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
    copilot-chat = {
        enable = true;
    };
  };
}
