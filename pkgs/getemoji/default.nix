{
  rustPlatform,
  openssl,
  pkg-config,
}:
rustPlatform.buildRustPackage {
  buildInputs = [ openssl ];
  cargoLock.lockFile = ./Cargo.lock;
  nativeBuildInputs = [ pkg-config ];
  pname = "getemoji";
  src = ./.;
  version = "0.1.0";
}
