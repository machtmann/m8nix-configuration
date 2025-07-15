{ inputs, ...}:
{
  imports = [
    ./packages
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    WINIT_UNIX_BACKEND = "wayland";
  };

  home.stateVersion = "25.11";
}
