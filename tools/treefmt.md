# Treefmt

MissionCtrl's pre-configured all-in-one formatter for all tools used in MissionCtrl.

## Languages

- `configuration` - nix configuration files
  - formats json, toml, yaml, github actions
- `js` - javascript and typescript files
  - formats javascript, typescript,
- `markdown` - markdown files
  - formats markdown
- `nix` - nix files
  - formats nix
- `python` - python files
  - formats python
- `shell` - shell files
  - formats shell
- `utilities` - utility files
  - changes line endings to unix
  - auto-sorts python imports
  - uses (keep-sorted)\[https://github.com/google/keep-sorted\] to sort misc lines
    - use `# keep-sorted start` and `# keep-sorted end` to mark the start and end of sorted lines and `keep-sorted start block=yes` to nest

## Lib Functions

- `mkTreefmtPackage` - create a treefmt package for a given language
  - inputs:
    - `languages` - attrset of languages to enable
      - e.g. `nix {configuration.enable = true;}`
  - returns:
    - `treefmt` - treefmt formatter derivation
- `mkTreefmtCheck` - create a treefmt check for a given language
  - inputs:
    - `languages` - attrset of languages to enable
      - e.g. `nix {configuration.enable = true;}`
  - returns:
    - `treefmt` - treefmt ci derivation

## Nix Usage

```nix
{
    # either use the mctrl-tools (collection of tools) flake or the mctrl-formatter (individual) flake
    inputs.mctrl-tools.url = "github:nikmctrl/mctrl-tools";
    inputs.mctrl-formatter.url = "github:nikmctrl/mctrl-formatter";

    outputs = {self, mctrl-tools, ...}: {
        # use the mctrl-tools or mctrl-formatter flake to get the formatter
        formatter.aarch64-darwin = mctrl-tools.packages.aarch64-darwin.mctrl-formatter;
        # or use the mctrl-formatter flake directly
        formatter.aarch64-darwin = mctrl-formatter.packages.aarch64-darwin.mctrl-formatter;

        # use the mctrl-tools or mctrl-formatter flake to get the checks
        checks.default = mctrl-tools.checks.isFormatted;
        # or use the mctrl-formatter flake directly
        checks.default = mctrl-formatter.checks.isFormatted;
    };
}
```

## Usage

```bash
# use the mctrl-tools or mctrl-formatter flake to get the formatter
nix run github:nikmctrl/mctrl-tools#mctrl-formatter
# or
nix run github:nikmctrl/mctrl-formatter
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
