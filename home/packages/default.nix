{ lib, ... }: {
  imports = [
    ./firefox.nix
    ./neovim.nix
    ./quickshell.nix
    ./scm.nix
    ./shell.nix
    ./tmux.nix
  ];
}
