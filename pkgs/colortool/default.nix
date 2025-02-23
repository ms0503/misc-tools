{ rustPlatform }:
rustPlatform.buildRustPackage {
  cargoLock.lockFile = ./Cargo.lock;
  pname = "colortool";
  src = ./.;
  version = "0.1.0";
}
