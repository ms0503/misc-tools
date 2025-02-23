{ rustPlatform }:
rustPlatform.buildRustPackage {
  cargoLock.lockFile = ./Cargo.lock;
  pname = "matrics";
  src = ./.;
  version = "0.1.0";
}
