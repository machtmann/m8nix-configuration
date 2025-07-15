{ pkgs, ... }:{

  programs.fish = {
    enable = true;

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../../";
      "...." = "cd ../../../";
      "ls" = "eza";
      "discord" = "vesktop";
      "nd" = "nix develop";
    };
  };
}
