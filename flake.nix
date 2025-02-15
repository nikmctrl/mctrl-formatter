{
  description = "MissionCtrl's pre-configured all-in-one formatter";

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
        treefmtEval = treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} {
          # nginx, dockerfile, css, jsx, ini, mako, html
          # maybe dprint
          projectRootFile = "flake.nix";

          imports = [
            ./languages
          ];

          
          programs.prettier = {
            enable = true;
          };

        };
        treefmtOut = treefmtEval.config.build;

        formatter = treefmtOut.wrapper;
      in
      rec {
        packages = {
          mctrl-formatter = formatter;
          default = formatter;
        };

        checks.formatted = treefmtOut.check self;

        inherit formatter;
      }
    );
}
