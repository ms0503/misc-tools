{ mold, rustPlatform }:
let
  cargoToml = builtins.fromTOML (builtins.readFile ./Cargo.toml);
in
rustPlatform.buildRustPackage {
  inherit (cargoToml.package) version;
  RUSTFLAGS = "-Clink-arg=-fuse-ld=mold";
  cargoLock.lockFile = ./Cargo.lock;
  nativeBuildInputs = [
    mold
  ];
  pname = cargoToml.package.name;
  src = ./.;
}
