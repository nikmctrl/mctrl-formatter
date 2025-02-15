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



          # GH Action linting
          programs.actionlint = {
            enable = true;
          };

          # Python
          

          # Markdown
          programs.mdformat = {
            enable = true;
          };

          # Shell
          programs.beautysh = {
            enable = true;
          };
          programs.shfmt = {
            enable = true;
          };
          programs.shellcheck = {
            enable = true;
          };

          # Nix
          programs.deadnix = {
            enable = true;
          };
          programs.nixfmt-rfc-style = {
            enable = true;
          };
          programs.statix = {
            enable = true;
          };

          # Configuration Files
          programs.jsonfmt = {
            enable = true;
          };
          programs.formatjson5 = {
            enable = true;
          };
          programs.taplo = {
            enable = true;
          };
          programs.toml-sort = {
            enable = true;
          };
          programs.yamlfmt = {
            enable = true;
          };

          # Unsorted
          programs.biome = {
            enable = true;
          };
          programs.prettier = {
            enable = true;
          };

          # Utils
          programs.dos2unix = {
            enable = true;
          };
          programs.isort = {
            enable = true;
          };
          programs.keep-sorted = {
            enable = true;
          };
        };
        treefmtOut = treefmtEval.config.build;
      in
      {
        packages.default = treefmtOut.wrapper;

        checks.formatted = treefmtOut.check;

        formatter = treefmtOut.wrapper;
      }
    );
}
