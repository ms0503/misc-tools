{
  inputs = {
    flake-compat = {
      flake = false;
      url = "github:edolstra/flake-compat";
    };
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs";
      url = "github:hercules-ci/flake-parts";
    };
    git-hooks = {
      inputs = {
        flake-compat.follows = "";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:cachix/git-hooks.nix";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems = {
      flake = false;
      url = "github:nix-systems/default";
    };
    treefmt-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/treefmt-nix";
    };
  };
  outputs =
    inputs@{
      flake-parts,
      git-hooks,
      nixpkgs,
      systems,
      treefmt-nix,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        git-hooks.flakeModule
        treefmt-nix.flakeModule
      ];
      perSystem =
        { config, system, ... }:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        in
        {
          _module.args.pkgs = pkgs;
          devShells.default = pkgs.mkShell {
            shellHook = ''
              ${config.pre-commit.installationScript}
            '';
          };
          packages = import ./pkgs pkgs;
          pre-commit = {
            check.enable = true;
            settings = {
              hooks = {
                actionlint.enable = true;
                check-toml.enable = true;
                editorconfig-checker = {
                  enable = true;
                  excludes = [
                    "Cargo.lock"
                    "flake.lock"
                  ];
                };
                markdownlint.enable = true;
                yamlfmt.enable = true;
                yamllint.enable = true;
              };
              src = ./.;
            };
          };
          treefmt = import ./treefmt.nix pkgs;
        };
      systems = import systems;
    };
}
