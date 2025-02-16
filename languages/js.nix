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
      excludes = [
        ".pre-commit-config.yaml"
      ];
      settings = {
        bracketSameLine = true;
        bracketSpacing = true;
        singleAttributePerLine = true;
        singleQuote = true;
        trailingComma = "all";
        printWidth = 120;
      };
    };
  };
}
