{ inputs, ...}:
{
  imports = [
    ./packages
  ];

  home.sessionVariables = {
    CONTAINER_RUNTIME = "containerd";
    DRIVER = "podman";
    EDITOR = "nvim";
    WINIT_UNIX_BACKEND = "wayland";
  };

  home.stateVersion = "25.11";
}
