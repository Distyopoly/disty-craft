{
  pkgs,
  _lib,
  _inputs,
  ...
}:
{
  # https://devenv.sh/packages/
  packages = [
    pkgs.git
    pkgs.git-cliff
  ];

  dotenv.disableHint = true;

  # https://devenv.sh/languages/
  languages = {
    javascript = {
      enable = true;
      package = pkgs.nodejs_22;
      pnpm.enable = true;
    };
  };

  treefmt = import ./nix/treefmt;

  scripts = {
    framework-install.exec = "pnpm install";
  };

  profiles = {
    hostname."leswell-nixos".module =
      let
        dev-port = "5173";
      in
      {
        # imports = [ ./nix/nginx ];

        packages = [
          pkgs.commitizen
          pkgs.nodePackages.localtunnel # will need to rewrite in future update, is already available in upstream: pkgs.localtunnel
        ];

        processes = {
          localtunnel.exec = "lt --port ${dev-port}";
          dev.exec = "pnpm dev --port ${dev-port}";
        };
      };
  };
}
