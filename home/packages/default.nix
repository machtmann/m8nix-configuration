{ lib, ... }: {
  imports = [
    ./firefox.nix
    ./freetube.nix
    ./mangohud.nix
    ./neovim.nix
    ./obsidian.nix
    ./quickshell.nix
    ./scm.nix
    ./shell.nix
    ./tmux.nix
  ];
}
