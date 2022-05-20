{
    description = "Temporalite flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }:
        flake-utils.lib.eachDefaultSystem (system:
            with nixpkgs.legacyPackages.${system}; rec {
                defaultPackage = buildGoModule rec {
                    name = "temporalite-${version}";
                    commit = "0797d11e124e64b068be86566ef6577d80563c9c";
                    version = "1.15.1";

                    src = fetchFromGitHub {
                        owner = "DataDog";
                        repo = "temporalite";
                        rev = "${commit}";
                        sha256 = "sha256-a0MzHLuNw/+VlPG+QO1QxEmalYk1qMVjjvBtL2pYqmQ=";
                    };

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