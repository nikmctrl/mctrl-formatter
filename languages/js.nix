{ config, lib, ... }:
let
  cfg = config.mctrl-formatter.js;
in
{
  options.mctrl-formatter.js = {
    enable = lib.mkEnableOption "Enable JavaScript formatter";
  };
  config = lib.mkIf cfg.enable {
    # programs.biome = {
    #   enable = true;
    # };
    programs.prettier = {
      enable = true;
    };
  };
}
