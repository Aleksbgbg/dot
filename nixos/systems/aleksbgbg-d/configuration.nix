{
  config,
  pkgs,
  lib,
  sops-nix,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/gc.nix

    ../../modules/core-pkgs.nix
    ../../modules/tools.nix
    ../../modules/rust-dev.nix

    ../../modules/programs/zsh.nix

    ../../modules/programs/top.nix

    sops-nix.nixosModules.default
  ];

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Networking
  networking.hostName = "aleksbgbg-d";
  networking.firewall.enable = false;
  networking.networkmanager.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Time
  time.timeZone = "Europe/London";

  # Locale
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  ## IME (Input Method Editor) for Korean
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";

    fcitx5.addons = with pkgs; [
      fcitx5-hangul
    ];
  };

  # X11 windowing
  services.xserver.enable = true;
  ## keymap
  services.xserver.xkb = {
    layout = "gb,bg";
    variant = ",phonetic";
  };

  # Console keymap
  console.keyMap = "uk";

  # KDE Plasma desktop environment
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Pipewire sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Main user
  users.users.aleksbgbg = {
    isNormalUser = true;
    description = "Aleks Todorov";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      kdePackages.kate
      krita
      blender
      renderdoc
      hyperfine
    ];
  };
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "aleksbgbg";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  fonts.packages = with pkgs; [
    nerd-fonts.monaspace
    noto-fonts-cjk-sans
  ];

  environment.systemPackages = with pkgs; [
    ungoogled-chromium
    vlc
    protonvpn-gui
    qbittorrent
    gparted
    gimp
    syncplay
  ];

  # Programs
  programs.firefox.enable = true;

  # Secrets
  sops = {
    defaultSopsFile = ../../secrets/aleksbgbg.yaml;

    age.sshKeyPaths = ["/home/aleksbgbg/.ssh/id_ed25519"];

    secrets.gitlab_runner_config = {
      mode = "0440";
      owner = config.users.users.aleksbgbg.name;
      group = config.users.users.aleksbgbg.group;

      restartUnits = ["gitlab-runner.service"];
    };
  };


  # GitLab Runner
  ## Networking
  boot.kernel.sysctl."net.ipv4.ip_forward" = true;

  ## Docker
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };

  services.gitlab-runner = {
    enable = true;
    settings = {
      concurrent = 5;
      listen_address = "127.0.0.1:9252";
    };

    services.runner = {
      # community managed, automatically updated nix image with flakes + commands pre-enabled
      dockerImage = "nixpkgs/nix-flakes:nixos-${config.system.nixos.release}-${pkgs.system}";
      dockerVolumes = [
        # passthrough bash & grep for gitlab ci (used inside the executor, not contained in the base image)
        "${lib.getExe pkgs.pkgsStatic.gnugrep}:/usr/bin/grep:ro"
        "${lib.getExe pkgs.pkgsStatic.bash}:/usr/bin/sh:ro"
        "${lib.getExe pkgs.pkgsStatic.bash}:/usr/bin/bash:ro"
      ];

      registrationFlags = [
        "--docker-pull-policy=if-not-present"
        "--docker-allowed-pull-policies=if-not-present"
        "--docker-allowed-pull-policies=always"
      ];

      authenticationTokenConfigFile = "/run/secrets/gitlab_runner_config";

      requestConcurrency = 1024;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
