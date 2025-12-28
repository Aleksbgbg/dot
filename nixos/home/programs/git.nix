{...}: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Aleks Todorov";
        email = "aleks.todorov.1337@gmail.com";
      };

      alias = {
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
}
