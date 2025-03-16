{ rustPlatform }:
let
  cargoToml = builtins.fromTOML (builtins.readFile ./Cargo.toml);
in
rustPlatform.buildRustPackage {
  inherit (cargoToml.package) version;
  cargoLock.lockFile = ./Cargo.lock;
  pname = cargoToml.package.name;
  src = ./.;
}
