{ mkDerivation, base, bytestring, happstack-server, stdenv, text
, web-routes
}:
mkDerivation {
  pname = "web-routes-happstack";
  version = "0.23.10";
  src = ./.;
  libraryHaskellDepends = [
    base bytestring happstack-server text web-routes
  ];
  description = "Adds support for using web-routes with Happstack";
  license = stdenv.lib.licenses.bsd3;
}
