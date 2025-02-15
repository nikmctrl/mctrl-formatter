{ config, lib, ... }:
let
  cfg = config.mctrl-formatter.utilities;
in
{
  options.mctrl-formatter.utilities = {
    enable = lib.mkEnableOption "Enable utility formatters";
  };
  config = lib.mkIf cfg.enable {
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
}
