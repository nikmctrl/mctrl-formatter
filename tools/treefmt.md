# Treefmt

MissionCtrl's pre-configured all-in-one formatter for all tools used in MissionCtrl.

## Nix Usage

```nix
{
    inputs.mctrl-tools.url = "github:nikmctrl/mctrl-tools";

    outputs = {self, mctrl-tools, ...}: {
        packages.aarch64-darwin.treefmt = mctrl-tools.packages.aarch64-darwin.treefmt;
    };
}
```

## Usage

```bash
nix run github:nikmctrl/treefmt
```

## Notes
- all treefmt implemented tools (as of 2025-02-15)  
```nix
[
  "actionlint"
  "alejandra"
  "asmfmt"
  "beautysh"
  "biome"
  "black"
  "buildifier"
  "cabal-fmt"
  "clang-format"
  "cljfmt"
  "cmake-format"
  "csharpier"
  "cue"
  "d2"
  "dart-format"
  "deadnix"
  "deno"
  "dhall"
  "dnscontrol"
  "dos2unix"
  "dprint"
  "elm-format"
  "erlfmt"
  "fantomas"
  "fish_indent"
  "fnlfmt"
  "formatjson5"
  "fourmolu"
  "fprettify"
  "gdformat"
  "genemichaels"
  "gleam"
  "gofmt"
  "gofumpt"
  "goimports"
  "google-java-format"
  "hclfmt"
  "hlint"
  "isort"
  "jsonfmt"
  "jsonnet-lint"
  "jsonnetfmt"
  "just"
  "keep-sorted"
  "ktfmt"
  "ktlint"
  "latexindent"
  "leptosfmt"
  "mdformat"
  "mdsh"
  "meson"
  "mix-format"
  "muon"
  "mypy"
  "nickel"
  "nimpretty"
  "nixfmt-classic"
  "nixfmt-rfc-style"
  "nixfmt"
  "nixpkgs-fmt"
  "nufmt"
  "ocamlformat"
  "odinfmt"
  "opa"
  "ormolu"
  "packer"
  "perltidy"
  "php-cs-fixer"
  "pinact"
  "prettier"
  "protolint"
  "purs-tidy"
  "rubocop"
  "ruff-check"
  "ruff-format"
  "rufo"
  "rustfmt"
  "scalafmt"
  "shellcheck"
  "shfmt"
  "sqlfluff"
  "sqruff"
  "statix"
  "stylish-haskell"
  "stylua"
  "swift-format"
  "taplo"
  "templ"
  "terraform"
  "texfmt"
  "toml-sort"
  "typos"
  "typstfmt"
  "typstyle"
  "yamlfmt"
  "zig"
  "zprint"
]
```
