{ config, lib, ... }:
let
  cfg = config.mctrl-formatter.python;
in
{
  options.mctrl-formatter.python = {
    enable = lib.mkEnableOption "Enable python formatter";
  };
  config = lib.mkIf cfg.enable {
    programs.black = {
      enable = true;
    };
    programs.mypy = {
      enable = true;
    };
    programs.ruff-check = {
      enable = true;
    };
    programs.ruff-format = {
      enable = true;
    };
  };
}
