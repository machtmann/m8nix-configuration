{ config, lib, pkgs, ... }:{

  imports = [ # Include the results of the hardware scan.
    ./disko-config.nix
    ./hardware-configuration.nix
    ./system/packages.nix
    ./system/gpu.nix
  ];

  boot = {
    blacklistedKernelModules = [ "nouveau" ];
    kernelPackages = pkgs.linuxPackages_latest;
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.enable = true;
    plymouth.enable = true;
  };

  fonts.packages = with pkgs; [ nerd-fonts.fira-code ];

  home-manager = { users.m8man = import ./home/home.nix; };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "latercyrheb-sun32";
    useXkbConfig = true;
  };

  networking.hostName = "m8nix-mobile";
  networking.networkmanager.enable = true;

  services = {
    blueman.enable = true;
    displayManager = { sddm.enable = true; sddm.theme = "tokyo-night-sddm"; };
    hypridle.enable = true;
    libinput.enable = true;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
    };
    openssh.enable = true;
    printing.enable = true;
    udisks2.enable = true;
  };

  # services.pulseaudio.enable = true;
  security.rtkit.enable = true;

  time.timeZone = "Europe/Amsterdam";

  users.users.m8man = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
    packages = with pkgs; [ tree ];
  };

  nix.settings = {
    download-buffer-size = 104857600;
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "m8man" ];
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?
}
