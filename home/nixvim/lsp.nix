{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;

      servers = {
        rust_analyzer.enable = true;
        nil_ls.enable = true;
        bashls.enable = true;
        yamlls.enable = true;
        jsonls.enable = true;
        dockerls.enable = true;
      };
    };

    cmp.enable = true;
    cmp-nvim-lsp.enable = true;
    luasnip.enable = true;
  };
}
