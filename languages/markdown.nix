{ config, lib, ... }:
let
  cfg = config.mctrl-formatter.markdown;
in
{
  options.mctrl-formatter.markdown = {
    enable = lib.mkEnableOption "Enable Markdown formatter";
  };
  config = lib.mkIf cfg.enable {
    programs.mdformat = {
      enable = true;
    };
  };
}
