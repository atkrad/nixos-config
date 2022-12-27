{ inputs, lib, config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    shortcut = "a";
    clock24 = true;
    baseIndex = 1;
    historyLimit = 10000;
    plugins = with pkgs.tmuxPlugins; [
      better-mouse-mode
      {
        plugin = dracula;
        extraConfig = ''
          set -g @dracula-show-left-icon session
          set -g @dracula-show-flags true
          set -g @dracula-show-powerline true
          set -g @dracula-refresh-rate 2
          set -g @dracula-military-time true
          set -g @dracula-plugins "time"
        '';
      }
    ];
    extraConfig = ''
      # Mouse works as expected
      set-option -g mouse on

      # pane: split
      bind | split-window -h -c '#{pane_current_path}'
      bind - split-window -v -c '#{pane_current_path}'
    '';
  };
}
