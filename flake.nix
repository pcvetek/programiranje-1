{
  description = "Delovno okolje za programiranje-1";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
  };

  outputs = inputs: {
    devShells = builtins.mapAttrs (system: pkgs: {
      default = pkgs.mkShell {
        buildInputs = with pkgs; [
          curl
          python3
          pkg-config
          zlib
          unzip
        ];
        packages = with pkgs; [
          ocaml
          ocamlPackages.ocaml-lsp
          ocamlPackages.ocamlformat
          ocamlPackages.utop
          elan
        ];
      };
    }) inputs.nixpkgs.legacyPackages;
  };
}
