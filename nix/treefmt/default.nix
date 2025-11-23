{
  enable = true;
  config = {
    programs = {
      nixfmt = {
        enable = true;
        strict = true;
      };
      deadnix.enable = true;
      # statix check highlights antipatterns in Nix code. statix fix can fix several such occurrences.
      statix.enable = true;

      yamlfmt.enable = true;

      # sorted things
      keep-sorted.enable = true;
    };
    settings.formatter = {
      deadnix = {
        priority = 1;
        options = [ "-_" ];
      };

      statix = {
        priority = 2;
      };

      nixfmt = {
        priority = 3;
      };

      yamlfmt = {
        priority = 4;
        includes = [
          "*.yaml"
          "*.yml"
        ];
      };
    };
  };
}
