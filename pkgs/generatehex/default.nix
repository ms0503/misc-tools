{ rustPlatform }:
rustPlatform.buildRustPackage {
  cargoLock.lockFile = ./Cargo.lock;
  pname = "generatehex";
  src = ./.;
  version = "0.1.0";
}
