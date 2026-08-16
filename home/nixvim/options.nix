{
  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    enableMan = false;

    opts = {
      number = true;
      relativenumber = true;

      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;

      mouse = "a";
    };
  };
}
