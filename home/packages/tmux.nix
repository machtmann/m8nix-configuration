{ pkgs, ... }:{

  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    prefix = "C-Space";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      yank

      {
        plugin = dracula;
	extraConfig = ''
	  set -g @dracula-refresh-rate 10
	  set -g @dracula-show-battery true
	  set -g @dracula-show-fahrenheit false
	  set -g @dracula-show-left-icon "#h | #S"
	  set -g @dracula-show-powerline true
	  set -g @dracula-show-weather true
	  set -g @dracula-transparent-powerline-bg true
	'';
      }
    ];

    extraConfig = ''
      white='#f8f8f2'
      gray='#4447a'
      dark_gray='#282a36'
      light_purple='#bd93f9'
      dark_purple='#627a4'
      cyan='#8be9fd'
      green='#50fa7b'
      orange='#ffb86c'
      red='#ff5555'
      pink='#ff79c6'
      yellow='#f1fa8c'

      bind -n M-H previous-window
      bind -n M-L next-window

      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1

      set-option -g mode-keys vi

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind-key -T root PageUp if-shell -F '#{pane_in_mode}' 'send-keys -X page-up' 'send-keys PageUp'
      bind-key -T root PageDown if-shell -F '#{pane_in_mode}' 'send-keys -X page-down' 'send-keys PageDown'

      bind '"' split-window -v -c '#{pane_current_path}'
      bind % split-window -h -c '#{pane_current_path}'
    '';

    sensibleOnTop = true;
    tmuxinator.enable = true;
  };
}
