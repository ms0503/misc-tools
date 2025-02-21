{ rustPlatform }:
rustPlatform.buildRustPackage {
  cargoLock.lockFile = ./Cargo.lock;
  pname = "skel";
  src = ./.;
  version = "2025-02-21";
}
