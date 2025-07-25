{ pkgs, ... }:{

  programs.fish = {
    enable = true;

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../../";
      "...." = "cd ../../../";
      "ls" = "eza";
      "nd" = "nix develop";
    };

    interactiveShellInit = ''
      set --universal tide_character_color 5FD700
      set --universal tide_character_color_failure FF0000
      set --universal tide_character_icon \u276f
      set --universal tide_character_vi_icon_default \u276e
      set --universal tide_character_vi_icon_replace \u25b6
      set --universal tide_character_vi_icon_visual V
      set --universal tide_chruby_bg_color B31209
      set --universal tide_chruby_color 000000
      set --universal tide_chruby_icon \ue23e
      set --universal tide_cmd_duration_bg_color C4A000
      set --universal tide_cmd_duration_color 000000
      set --universal tide_cmd_duration_decimals 0
      set --universal tide_cmd_duration_icon \uf252
      set --universal tide_cmd_duration_threshold 3000
      set --universal tide_context_always_display false
      set --universal tide_context_bg_color 444444
      set --universal tide_context_color_default D7AF87
      set --universal tide_context_color_root D7AF00
      set --universal tide_context_color_ssh D7AF87
      set --universal tide_git_bg_color 4E9A06
      set --universal tide_git_bg_color_unstable C4A000
      set --universal tide_git_bg_color_urgent CC0000
      set --universal tide_git_color_branch 000000
      set --universal tide_git_color_conflicted 000000
      set --universal tide_git_color_dirty 000000
      set --universal tide_git_color_operation 000000
      set --universal tide_git_color_staged 000000
      set --universal tide_git_color_stash 000000
      set --universal tide_git_color_untracked 000000
      set --universal tide_git_color_upstream 000000
      set --universal tide_git_icon \uf1d3
      set --universal tide_go_bg_color 00ACD7
      set --universal tide_go_color 000000
      set --universal tide_go_icon \ue627
      set --universal tide_jobs_bg_color 444444
      set --universal tide_jobs_color 4E9A06
      set --universal tide_jobs_icon \uf013
      set --universal tide_kubectl_bg_color 326CE5
      set --universal tide_kubectl_color 000000
      set --universal tide_kubectl_icon \u2388
      set --universal tide_left_prompt_frame_enabled false
      set --universal tide_left_prompt_items os\x1epwd\x1egit\x1enewline\x1echaracter
      set --universal tide_left_prompt_prefix
      set --universal tide_left_prompt_separator_diff_color \ue0b0
      set --universal tide_left_prompt_separator_same_color \ue0b1
      set --universal tide_left_prompt_suffix \ue0b0
      set --universal tide_node_bg_color 44883E
      set --universal tide_node_color 000000
      set --universal tide_node_icon \u2b22
      set --universal tide_os_bg_color CED7CF
      set --universal tide_os_color 080808
      set --universal tide_os_icon \uf179
      set --universal tide_php_bg_color 617CBE
      set --universal tide_php_color 000000
      set --universal tide_php_icon \ue608
      set --universal tide_prompt_add_newline_before false
      set --universal tide_prompt_color_frame_and_connection 6C6C6C
      set --universal tide_prompt_color_separator_same_color 949494
      set --universal tide_prompt_icon_connection \x20
      set --universal tide_prompt_min_cols 26
      set --universal tide_prompt_pad_items true
      set --universal tide_pwd_bg_color 3465A4
      set --universal tide_pwd_color_anchors E4E4E4
      set --universal tide_pwd_color_dirs E4E4E4
      set --universal tide_pwd_color_truncated_dirs BCBCBC
      set --universal tide_pwd_icon \uf07c
      set --universal tide_pwd_icon_home \uf015
      set --universal tide_pwd_icon_unwritable \uf023
      set --universal tide_pwd_markers \x2ebzr\x1e\x2ecitc\x1e\x2egit\x1e\x2ehg\x1e\x2enode\x2dversion\x1e\x2epython\x2dversion\x1e\x2eruby\x2dversion\x1e\x2eshorten_folder_marker\x1e\x2esvn\x1e\x2eterraform\x1eCargo\x2etoml\x1ecomposer\x2ejson\x1eCVS\x1ego\x2emod\x1epackage\x2ejson
      set --universal tide_right_prompt_frame_enabled false
      set --universal tide_right_prompt_prefix \ue0b2
      set --universal tide_right_prompt_separator_diff_color \ue0b2
      set --universal tide_right_prompt_separator_same_color \ue0b3
      set --universal tide_right_prompt_suffix
      set --universal tide_rustc_bg_color F74C00
      set --universal tide_rustc_color 000000
      set --universal tide_rustc_icon \ue7a8
      set --universal tide_shlvl_bg_color 808000
      set --universal tide_shlvl_color 000000
      set --universal tide_shlvl_icon \uf120
      set --universal tide_shlvl_threshold 1
      set --universal tide_status_bg_color 2E3436
      set --universal tide_status_bg_color_failure CC0000
      set --universal tide_status_color 4E9A06
      set --universal tide_status_color_failure FFFF00
      set --universal tide_status_icon \u2714
      set --universal tide_status_icon_failure \u2718
      set --universal tide_time_bg_color D3D7CF
      set --universal tide_time_color 000000
      set --universal tide_time_format \x25T
      set --universal tide_vi_mode_bg_color_default 008000
      set --universal tide_vi_mode_bg_color_replace 808000
      set --universal tide_vi_mode_bg_color_visual 000080
      set --universal tide_vi_mode_color_default 000000
      set --universal tide_vi_mode_color_replace 000000
      set --universal tide_vi_mode_color_visual 000000
      set --universal tide_vi_mode_icon_default DEFAULT
      set --universal tide_vi_mode_icon_replace REPLACE
      set --universal tide_vi_mode_icon_visual VISUAL

      set -g direnv_fish_mode eval_on_arrow

      set -x EDITOR nvim
      set -x LESS -R
      set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
      set -x PAGER less
      set -x TERM xterm-256color
      set -x VISUAL nvim
    '';

    loginShellInit = ''
      direnv hook fish | source
    '';

    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
    ];

  };
}
