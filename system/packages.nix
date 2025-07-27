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
    discord

    # Rice
    tokyo-night-sddm
    starship

    # Tools
    alsa-lib
    caelestia-cli
    cliphist
    devenv
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

  programs = {
    firefox.enable = true;
    fish.enable = true;
    hyprland.enable = true;
    hyprlock.enable = true;
    steam = {
      enable = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      package = pkgs.steam.override {
        extraLibraries = pkgs: with pkgs; [
          alsa-lib
          keyutils
          libkrb5
          libpng
          libpulseaudio
          libvorbis
          libxkbcommon
          pipewire
          source-han-sans
          source-han-serif
          source-sans
          source-serif
          stdenv.cc.cc.lib
          udev
          vulkan-loader
          wayland
          xorg.libX11
          xorg.libXScrnSaver
          xorg.libXcursor
          xorg.libXcursor
          xorg.libXi
          xorg.libXi
          xorg.libXinerama
          xorg.libXrandr
        ];
      };
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    xwayland.enable = true;
  };
}
