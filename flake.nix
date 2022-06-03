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
                    vendorSha256 = "sha256-pMS6g/4rBJT8oMKo6viJjl/+9oTSvcAcwTouwy7kj08=";
                    doCheck = false;
                };

                devShell = mkShell {
                    nativeBuildInputs = [ bashInteractive defaultPackage ];
                    buildInputs = [ ];
                };
            }
        );
}