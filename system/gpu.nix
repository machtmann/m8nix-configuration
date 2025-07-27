{ config, lib, pkgs, ... }:{

  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "modesetting" "nvidia" ];
    };
  };

  hardware = {
    graphics.enable = true;
    nvidia = {
      open = true;
      prime = {
        offload.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
