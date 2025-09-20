{
  pkgs,
  lib,
  ...
}: {
  programs.tmux = {
    enable = true;

    plugins = with pkgs.tmuxPlugins; [
      nord

      {
        plugin = resurrect;
        extraConfig = ''
          resurrect_dir="$HOME/.tmux/resurrect"
          set -g @resurrect-dir $resurrect_dir
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-hook-post-save-all "sed 's/--cmd[^ ]* [^ ]* [^ ]*//g' $resurrect_dir/last | sponge $resurrect_dir/last"
          set -g @resurrect-processes '"~nvim"'
        '';
      }
    ];

    extraConfig = lib.fileContents ../../../tmux/.tmux.conf;
  };
}
