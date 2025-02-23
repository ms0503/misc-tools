{ rustPlatform }:
rustPlatform.buildRustPackage {
  cargoLock.lockFile = ./Cargo.lock;
  pname = "getcodepoint";
  src = ./.;
  version = "0.1.0";
}
