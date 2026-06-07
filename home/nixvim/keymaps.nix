{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
    }

    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<CR>";
    }

    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<CR>";
    }

    {
      mode = "n";
      key = "<leader>.";
      action = "<cmd>lua Snacks.scratch()<CR>";
    }

    {
      mode = "n";
      key = "<leader>S";
      action = "<cmd>lua Snacks.scratch.select()<CR>";
    }

    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>lua Snacks.lazygit()<CR>";
    }

    {
      mode = "n";
      key = "<leader>n";
      action = "<cmd>lua Snacks.notifier.show_history()<CR>";
    }

    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>lua Snacks.bufdelete()<CR>";
    }

    {
      mode = "n";
      key = "<leader>un";
      action = "<cmd>lua Snacks.notifier.hide()<CR>";
    }

    {
      mode = "n";
      key = "<leader>tf";
      action = "<cmd>lua Snacks.terminal()<CR>";
    }

    {
      mode = "n";
      key = "<leader>th";
      action = "<cmd>lua Snacks.terminal(nil, {win = {position = 'bottom', height = 8}})<CR>";
    }
  ];
}
