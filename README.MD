# mctrl-formatter

A formatter for MissionCtrl.

## Omnix command

```nushell
om ci run --systems github:nix-systems/default . | cachix push nikmctrl;
let output = open ./result | from json;

cachix pin nikmctrl mctrl-formatter $output.result.ROOT.build.byName.treefmt;
cachix pin nikmctrl mctrl-formatter-ci $output.result.ROOT.build.byName.treefmt-check;
```
