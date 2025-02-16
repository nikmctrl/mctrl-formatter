{ config, lib, ... }:
let
  cfg = config.mctrl-formatter.nix;
in
{
  options.mctrl-formatter.nix = {
    enable = lib.mkEnableOption "Enable Nix formatter";
  };
  config = lib.mkIf cfg.enable {
    programs.deadnix = {
      enable = true;
    };
    programs.nixfmt = {
      enable = true;
      strict = true;
    };
    programs.statix = {
      enable = true;
    };
  };
}
