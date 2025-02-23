{ rustPlatform }:
rustPlatform.buildRustPackage {
  cargoLock.lockFile = ./Cargo.lock;
  pname = "urlencode";
  src = ./.;
  version = "0.1.0";
}
