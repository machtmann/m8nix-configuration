{ lib, ... }: {
  imports = [
    ./firefox.nix
    ./freetube.nix
    ./neovim.nix
    ./obsidian.nix
    ./quickshell.nix
    ./scm.nix
    ./shell.nix
    ./tmux.nix
  ];
}
