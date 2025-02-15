{
  description = "MissionCtrl's pre-configured all-in-one formatter";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = { self, nixpkgs, flake-utils, treefmt-nix }: flake-utils.lib.eachDefaultSystem (system: let
    treefmtEval = treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} {
      projectRootFile = "flake.nix";
      programs.terraform.enable = true;
    };

    treefmtOut = treefmtEval.config.build;
  in {
      packages.default = treefmtOut.wrapper;

      checks.formatted = treefmtOut.check;
  });
}
