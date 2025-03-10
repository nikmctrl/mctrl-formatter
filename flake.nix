{
  description = "MissionCtrl's pre-configured all-in-one formatter";

  nixConfig = {
    extra-substituters = [ "https://nikmctrl.cachix.org" ];
    extra-trusted-public-keys = [
      "nikmctrl.cachix.org-1:W91Ki7qcSFa1E3krRGlilwh7qyfui0cx7Bdj6wwOgvA="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      treefmt-nix,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        treefmtEvalFn =
          languages:
          treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} {
            # nginx, dockerfile, css, jsx, ini, mako, html
            # maybe dprint
            projectRootFile = "flake.nix";

            imports = [ ./languages ];

            mctrl-formatter = languages;
          };

        treefmtEval = treefmtEvalFn {
          configuration.enable = true;
          js.enable = true;
          markdown.enable = true;
          nix.enable = true;
          python.enable = true;
          shell.enable = true;
          utilities.enable = true;
        };

        mkTreefmtPackage = languages: (treefmtEvalFn languages).config.build.wrapper;
        mkTreefmtCheck = languages: (treefmtEvalFn languages).config.checks.default;

        treefmtOut = treefmtEval.config.build;
        formatter = treefmtOut.wrapper;
        formatter-ci = treefmtOut.check self;

      in
      rec {
        packages = {
          default = formatter;
          mctrl-formatter = formatter;
          mctrl-formatter-ci = formatter-ci;
        };

        checks = {
          isFormatted = formatter-ci;
        };

        lib = {
          inherit mkTreefmtPackage;
          inherit mkTreefmtCheck;
        };

        inherit formatter;

      }
    );
}
