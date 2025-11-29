{ server-name, config-dir }:
let
  cert-dir = "${config-dir}/live/${server-name}";
in
''
  server {
    listen              4443 ssl;
    server_name         ${server-name}
    ssl_certificate     /ideapard.crt;
    ssl_certificate     ${cert-dir}/fullchain.pem;
    ssl_certificate_key ${cert-dir}/privkey.pem;

    ssl_protocols TLSv1.3;

    location / {
      proxy_pass http://localhost:5173;
    }
  }

  server {
      listen 8080;
      server_name ${server-name};

      # Redirect all HTTP requests to HTTPS
      return 301 https://$host$request_uri;
  }
''
