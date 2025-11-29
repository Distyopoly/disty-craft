{ config, pkgs, ... }:
let
  base-dir = "${config.git.root}/certs/ssl/letsencrypt";
in
{
  services.nginx = {
    enable = true;
    # httpConfig = import ./simple_http_hello.nix { server-name = "ideapard.distyopoly.xyz"; };
    httpConfig = import ./https_proxy.nix {
      server-name = "ideapard.distyopoly.xyz";
      config-dir = "${base-dir}/config";
    };
  };

  # processes.nginx.user = "leswellhm";

  packages = [ pkgs.certbot ];

  scripts."ssl-update".exec =
    "certbot certonly --config-dir ${base-dir}/config --work-dir ${base-dir}/tmp --logs-dir ${base-dir}/logs --standalone --agree-tos -d ideapard.distyopoly.xyz";
}
