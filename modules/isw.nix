{ config, lib, pkgs, ... }:

let
  iswPkg = pkgs.stdenv.mkDerivation {
    pname = "isw";
    version = "1.10";

    src = pkgs.fetchFromGitHub {
      owner = "YoyPa";
      repo = "isw";
      rev = "1.10";
      sha256 = "sha256-ZRHLhf0C3b5GhqlkZPBGooHL/UFfyfbp7XtPy9flz0k=";
    };

    buildInputs = [ pkgs.python3 ];

    installPhase = ''
      mkdir -p $out/bin $out/etc $out/lib/systemd/system
      install -Dm755 isw $out/bin/isw
      install -Dm644 etc/isw.conf $out/etc/isw.conf
      install -Dm644 etc/modprobe.d/isw-ec_sys.conf $out/etc/modprobe.d/isw-ec_sys.conf
      install -Dm644 etc/modules-load.d/isw-ec_sys.conf $out/etc/modules-load.d/isw-ec_sys.conf
      install -Dm644 usr/lib/systemd/system/isw@.service $out/lib/systemd/system/isw@.service
    '';
  };
in {
  environment.systemPackages = [ iswPkg ];

  environment.etc."isw.conf".source = "${iswPkg}/etc/isw.conf";

  boot.kernelModules = [ "ec_sys" ];
  boot.extraModprobeConfig = ''
    options ec_sys write_support=1
  '';
}

