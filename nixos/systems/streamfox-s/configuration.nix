{
  config,
  sops-nix,
  streamfox,
  streamfox-live,
  streamfox-live-staging,
  opencraft,
  mdb,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/gc.nix

    ../../modules/core-pkgs.nix
    ../../modules/tools.nix

    ../../modules/programs/zsh.nix

    ../../modules/programs/top.nix

    sops-nix.nixosModules.default

    streamfox.nixosModules.default
    streamfox-live.nixosModules.default
    opencraft.nixosModules.default
    mdb.nixosModules.default
  ];

  # Use the systemd-boot EFI bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "streamfox-s";
  networking.firewall.enable = false;

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
  console.keyMap = "uk";

  users.users.aleksbgbg = {
    isNormalUser = true;
    description = "Aleks Todorov";
    extraGroups = ["wheel"];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Secrets
  sops = {
    defaultSopsFile = ../../secrets/streamfox.yaml;

    age.sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    age.keyFile = "/var/lib/sops-nix/key.txt";
    age.generateKey = true;

    secrets.cloudflare_origin_certificate_key = {
      mode = "0440";
      owner = config.users.users.nginx.name;
      group = config.users.users.nginx.group;

      restartUnits = ["nginx.service"];
    };
  };

  # Services
  services.openssh.enable = true;

  services.nginx = {
    enable = true;

    recommendedProxySettings = true;

    virtualHosts = {
      "streamfox.aleksbgbg.xyz" = {
        onlySSL = true;

        sslCertificate = ./ssl-certs/cert.crt;
        sslCertificateKey = "/run/secrets/cloudflare_origin_certificate_key";

        locations."/" = {
          proxyPass = "http://localhost:9000";
          extraConfig = ''
            client_max_body_size 100m;
          '';
        };
      };

      "streamfox-live.aleksbgbg.xyz" = {
        onlySSL = true;

        sslCertificate = ./ssl-certs/cert.crt;
        sslCertificateKey = "/run/secrets/cloudflare_origin_certificate_key";

        locations."/".proxyPass = "http://unix:/var/run/streamfox-live/http.sock";
      };
      "staging-streamfox-live.aleksbgbg.xyz" = {
        onlySSL = true;

        sslCertificate = ./ssl-certs/cert.crt;
        sslCertificateKey = "/run/secrets/cloudflare_origin_certificate_key";

        locations."/".proxyPass = "http://unix:/var/run/staging/streamfox-live/http.sock";
      };

      "opencraft.aleksbgbg.xyz" = {
        onlySSL = true;

        sslCertificate = ./ssl-certs/cert.crt;
        sslCertificateKey = "/run/secrets/cloudflare_origin_certificate_key";

        root = "/var/run/opencraft/frontend";
      };

      "mdb.aleksbgbg.xyz" = {
        onlySSL = true;

        sslCertificate = ./ssl-certs/cert.crt;
        sslCertificateKey = "/run/secrets/cloudflare_origin_certificate_key";

        locations."/".proxyPass = "http://unix:/var/run/mdb/http.sock";
      };
    };
  };

  services.streamfox = {
    enable = true;

    port = 9000;
    secureUrls = true;
  };

  services.streamfoxLive = {
    enable = true;

    httpUnixSocket = true;

    publicIp = "147.12.196.53";
    webRtcPortMux = 9002;
  };

  services.opencraft = {
    enable = true;
  };

  services.mdb = {
    enable = true;

    unixSocket = true;
  };

  systemd.tmpfiles.rules = [
    # Type Path Mode User Group Age Argument
    "d /var/run/staging 0777 root root - -"
    "d /var/run/staging/streamfox-live 0777 root root - -"
  ];

  containers.staging = {
    autoStart = true;

    bindMounts."/var/run/streamfox-live" = {
      hostPath = "/var/run/staging/streamfox-live";
      isReadOnly = false;
    };

    config = {...}: {
      imports = [
        streamfox-live-staging.nixosModules.default
      ];

      services.streamfoxLive = {
        enable = true;

        httpUnixSocket = true;

        publicIp = "147.12.196.53";
        webRtcPortMux = 9004;

        debug.webRtcLogLevel = "debug";
      };

      system.stateVersion = "25.05";
    };
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
  system.stateVersion = "24.11"; # Did you read the comment?
}
