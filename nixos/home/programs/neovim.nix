{lib, ...}: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;

    extraConfig = lib.fileContents ../../../nvim/init.vim;
  };
  home.file.".config/nvim/lua/init.lua".text = lib.fileContents ../../../nvim/init.lua;
}
