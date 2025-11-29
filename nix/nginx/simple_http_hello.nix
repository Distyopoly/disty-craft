{ server-name }:
''
  server {
      listen 8080;
      server_name ${server-name};

      location / {
          return 200 "hello\n";
          add_header Content-Type text/plain;
      }
  }
''
