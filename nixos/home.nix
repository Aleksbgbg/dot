{
  pkgs,
  lib,
  ...
}: {
  home.username = "aleksbgbg";
  home.homeDirectory = "/home/aleksbgbg";

  programs.git = {
    enable = true;

    userName = "Aleks Todorov";
    userEmail = "aleks.todorov.1337@gmail.com";

    aliases = {
      ame = "commit --amend --no-edit";
      amed = "commit --amend";
      bla = "blame -w -C -C -C";
      chp = "cherry-pick";
      com = "commit";
      coms = "commit --sign";
      dif = "diff --staged";
      ff = "merge --ff-only";
      fix = "commit --fixup";
      lo = "log --oneline";
      lol = "log --graph --pretty=format:'%C(auto)%h%d%Creset %C(cyan)(%cr)%Creset %C(green)%cn <%ce>%Creset %s'";
      lold = "log --graph --pretty=format:'%C(auto)%h%d%Creset %C(cyan)(%ci)%Creset %C(green)%cn <%ce>%Creset %s'";
      los = "log --format=%<(50,trunc)%s";
      pullr = "pull --rebase";
      pushf = "push --force-with-lease";
      rb = "rebase";
      sta = "stash save --staged --message";
      sw = "switch";
      swc = "switch --create";
    };

    extraConfig = {
      color.ui = "auto";

      commit.verbose = true;

      core.autocrlf = "input";
      core.editor = "nvim";
      core.ignorecase = false;

      diff.algorithm = "patience";

      gc.pruneexpire = "90 days";

      merge.conflictStyle = "diff3";

      pull.ff = "only";

      rebase.autostash = true;

      rerere.enabled = true;
    };
  };

  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;

    extraConfig = lib.fileContents ../nvim/init.vim;
  };
  home.file.".config/nvim/lua/init.lua".text = lib.fileContents ../nvim/init.lua;

  programs.alacritty = {
    enable = true;

    theme = "nord";

    settings = {
      env.TERM = "xterm-256color";

      font = {
        size = 12;
      };

      scrolling.multiplier = 5;

      selection.save_to_clipboard = true;
    };
  };

  programs.tmux = {
    enable = true;

    plugins = with pkgs; [
      tmuxPlugins.nord
    ];

    extraConfig = lib.fileContents ../tmux/.tmux.conf;
  };

  programs.obs-studio = {
    enable = true;
  };

  programs.vesktop = {
    enable = true;
  };

  home.stateVersion = "25.05";
}
