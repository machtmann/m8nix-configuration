{ inputs, ...}:
{
  imports = [
    ./packages
  ];

  home.sessionVariables = {
    CONTAINER_RUNTIME = "containerd";
    DIRENV_LOG_FORMAT = "";
    DRIVER = "podman";
    EDITOR = "nvim";
    WINIT_UNIX_BACKEND = "wayland";
  };

  home.stateVersion = "25.11";
}
