{
    description = "Temporalite flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs";
        flake-utils.url = "github:numtide/flake-utils";
        temporalite.url = "github:DataDog/temporalite";
        temporalite.flake = false;
    };

    outputs = { self, nixpkgs, flake-utils, temporalite }:
        flake-utils.lib.eachDefaultSystem (system:
            with nixpkgs.legacyPackages.${system}; rec {
                defaultPackage = buildGo118Module rec {
                    name = "temporalite";
                    src = temporalite;
                    subPackages = [ "cmd/temporalite" ];
                    vendorSha256 = "sha256-z8p9uyxxAiSV/zG1DqpQ01dALhVxjeGWQxOl4BP/BRU=";
                    doCheck = false;
                };

                devShell = mkShell {
                    nativeBuildInputs = [ bashInteractive defaultPackage ];
                    buildInputs = [ ];
                };
            }
        );
}