{ pkgs, lib, ... }:

let
  ferroxide = pkgs.buildGoModule rec {
    pname = "ferroxide";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "acheong08";
      repo = "ferroxide";
      rev = "main";

      # Replace with the hash Nix reports on the first build.
      hash = lib.fakeHash;
    };

    # Ferroxide's executable lives here.
    subPackages = [ "cmd/ferroxide" ];

    # Replace this with the hash Nix reports on the first build.
    vendorHash = lib.fakeHash;

    meta = {
      description = "Third-party Proton Mail CardDAV, IMAP and SMTP bridge";
      homepage = "https://github.com/acheong08/ferroxide";
      license = lib.licenses.mit;
      mainProgram = "ferroxide";
    };
  };
in
{
  environment.systemPackages = [
    ferroxide
  ];

  users.users.ferroxide = {
    isSystemUser = true;
    group = "ferroxide";
    home = "/var/lib/ferroxide";
    createHome = true;
  };

  users.groups.ferroxide = {};

  systemd.services.ferroxide = {
    description = "Ferroxide Proton Mail Bridge";

    wantedBy = [ "multi-user.target" ];

    after = [
      "network-online.target"
    ];

    wants = [
      "network-online.target"
    ];

    serviceConfig = {
      Type = "simple";

      User = "ferroxide";
      Group = "ferroxide";

      WorkingDirectory = "/var/lib/ferroxide";

      ExecStart = "${ferroxide}/bin/ferroxide serve";

      Restart = "on-failure";
      RestartSec = "5s";

      # Security hardening
      NoNewPrivileges = true;
      PrivateTmp = true;
      ProtectSystem = "strict";
      ProtectHome = true;

      # Ferroxide needs persistent access to its data/config.
      ReadWritePaths = [
        "/var/lib/ferroxide"
      ];
    };
  };
}

# sudo -u ferroxide -H ferroxide auth YOUR_PROTON_USERNAME
# sudo systemctl enable --now ferroxide
