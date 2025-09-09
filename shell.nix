{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, bytestring, happstack-server, stdenv
      , text, web-routes, cabal-install
      }:
      mkDerivation {
        pname = "web-routes-happstack";
        version = "0.23.10";
        src = ./.;
        libraryHaskellDepends = [
          base bytestring happstack-server text cabal-install
        ];
        description = "Adds support for using web-routes with Happstack";
        license = stdenv.lib.licenses.bsd3;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f {};

in

  if pkgs.lib.inNixShell then drv.env else drv
