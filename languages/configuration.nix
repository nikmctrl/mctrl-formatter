{ config, lib, ... }:
let
  cfg = config.mctrl-formatter.configuration;
in
{
  options.mctrl-formatter.configuration = {
    enable = lib.mkEnableOption "Enable configuration file formatters";
  };
  config = lib.mkIf cfg.enable {
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
      excludes = [ ".pre-commit-config.yaml" ];
    };
    programs.actionlint = {
      enable = true;
    };
  };
}
