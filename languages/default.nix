{
  imports = [
    ./python.nix
    ./nix.nix
    ./markdown.nix
    ./configuration.nix
    ./shell.nix
    ./utilities.nix
    ./js.nix
  ];

  programs.dprint = {
    enable = true;
    settings = {
      plugins = [ "https://plugins.dprint.dev/dockerfile-0.3.2.wasm" ];
      includes = [ "*.Dockerfile*" ];
    };
  };
}
