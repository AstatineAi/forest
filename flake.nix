{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    forester = {
      url = "sourcehut:~jonsterling/ocaml-forester";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem =
        { inputs', pkgs, ... }:
        {
          packages.default = pkgs.stdenv.mkDerivation {
            name = "dist";
            src = ./.;
            nativeBuildInputs = [
              inputs'.forester.packages.default
              (pkgs.texliveMedium.withPackages (
                ps: with ps; [
                  standalone
                  mlmodern
                  amsfonts
                  amsmath
                  zx-calculus
                  tikz-cd
                  l3packages
                  dvisvgm
                  pgf
                  etoolbox
                  mathtools
                  stmaryrd
                  newtx
                  newpx
                  xstring
                  fontaxes
                  kastrup
                  spath3
                  xpatch
                ]
              ))
            ];
            buildPhase = ''
              forester build forest.toml
            '';
            installPhase = ''
              mkdir -p $out
              cp -r output/* $out
            '';
          };
        };
    };
}
