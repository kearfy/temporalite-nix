# Temporalite nix flake with nix-direnv

A basic flake that packages [temporalite](https://github.com/DataDog/temporalite) (version 1.15.1) and makes it available for direnv via nix-direnv.

## Requirements

- **direnv:** *Tested with 2.29.0 and 2.31.0* 

    Make sure to have the latest version of direnv installed, packages in repositories may be outdated. A oneliner to install from binary builds can be found [here](https://github.com/direnv/direnv/blob/master/docs/installation.md).

- **nix:** *Tested with 2.8.1 on ubuntu 18.04.6 via DistroD on WSL (multi-user installation) and on NixOS 21.11 via WSL*

    Instructions to install nix or NixOS can be found [on their website](https://nixos.org/download.html).

## Usage

- Make sure to run `direnv allow` when entering the directory for the first time.
- Make sure to specify a database file when executing temporalite, it will try to place one in your home directory by default, but this will escalate into a permission error. Example:

    ``temporalite -f database-file.db``





