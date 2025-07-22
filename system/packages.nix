{ pkgs, ... }:

let
  caelestia-cli = pkgs.callPackage ../modules/caelestia/cli.nix { };
  tokyo-night-sddm = pkgs.libsForQt5.callPackage ../modules/sddm/sddm.nix { };
in {

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Applications
    blender
    keepassxc
    readest
    signal-desktop
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
    nh
    nix-output-monitor
    secretspec
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
}
