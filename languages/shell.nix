{ config, lib, ... }:
let
  cfg = config.mctrl-formatter.shell;
in
{
  options.mctrl-formatter.shell = {
    enable = lib.mkEnableOption "Enable shell script formatter";
  };
  config = lib.mkIf cfg.enable {
    programs.beautysh = {
      enable = true;
    };
    programs.shfmt = {
      enable = true;
    };
    programs.shellcheck = {
      enable = true;
    };
  };
}
