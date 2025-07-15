{ config, lib, pkgs, ... }:

let
  caelestia-cli = pkgs.callPackage ./modules/caelestia/cli.nix { };
  tokyo-night-sddm = pkgs.libsForQt5.callPackage ./modules/sddm/sddm.nix { };
in {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./disko-config.nix
  ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
    blacklistedKernelModules = [ "nouveau" ];
    plymouth.enable = true;
  };

  networking.hostName = "m8nix-mobile";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "latercyrheb-sun32";
    useXkbConfig = true;
  };

  services = {
    displayManager = { sddm.enable = true; sddm.theme = "tokyo-night-sddm"; };
    xserver = {
      enable = true;
      videoDrivers = [ "modesetting" ];
    };
  };
  services.udisks2.enable = true;

  services.printing.enable = true;

  # services.pulseaudio.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
  };

  services.libinput.enable = true;

  users.users.m8man = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
    packages = with pkgs; [ tree ];
  };

  home-manager = { users.m8man = import ./home/home.nix; };

  programs = {
    firefox.enable = true;
    fish.enable = true;
    hyprland.enable = true;
    hyprlock.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Applications
    blender
    keepassxc
    vesktop

    # Rice
    tokyo-night-sddm

    # Tools
    alsa-lib
    caelestia-cli
    cliphist
    eza
    fastfetch
    fish
    gcc
    git
    hyprpaper
    kitty
    neovim
    starship
    wget

    app2unit
    cliphist
    dart-sass
    fuzzel
    glib
    grim
    libnotify
    libpulseaudio
    slurp
    swappy
    wl-clipboard
    wl-screenrec
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    download-buffer-size = 104857600;
  };

  services = {
    openssh.enable = true;
    blueman.enable = true;
    hypridle.enable = true;
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

