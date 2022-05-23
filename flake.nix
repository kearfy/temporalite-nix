{
    description = "Temporalite flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs";
        flake-utils.url = "github:numtide/flake-utils";
        temporalite.url = "github:DataDog/temporalite?rev=0797d11e124e64b068be86566ef6577d80563c9c";
        temporalite.flake = false;
    };

    outputs = { self, nixpkgs, flake-utils, temporalite }:
        flake-utils.lib.eachDefaultSystem (system:
            with nixpkgs.legacyPackages.${system}; rec {
                defaultPackage = buildGoModule rec {
                    name = "temporalite-${version}";
                    version = "1.15.1";
                    src = temporalite;
                    subPackages = [ "cmd/temporalite" ];
                    vendorSha256 = "sha256-1UQ3qparXahO7ox/H4Begt9h/sGI3sN5R7NssxshQo8=";
                    doCheck = false;
                };

                devShell = mkShell {
                    nativeBuildInputs = [ bashInteractive defaultPackage ];
                    buildInputs = [ ];
                };
            }
        );
}