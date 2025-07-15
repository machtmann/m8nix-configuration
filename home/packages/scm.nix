{ pkgs, ... }: {
  programs = {
    git = {
      enable = true;
      userEmail = "moritz.achtmann@gmail.com";
      userName = "m8man";
      package = pkgs.gitMinimal;
    };

    lazygit = { enable = true; };

    jujutsu = {
      enable = true;
      settings = {
        user = {
          name = "m8man";
          email = "moritz.achtmann@gmail.com";
        };
      };
    };
  };
}
