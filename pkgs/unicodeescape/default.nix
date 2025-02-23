{ rustPlatform }:
rustPlatform.buildRustPackage {
  cargoLock.lockFile = ./Cargo.lock;
  pname = "unicodeescape";
  src = ./.;
  version = "0.1.0";
}
