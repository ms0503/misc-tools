{
  openssl,
  pkg-config,
  rustPlatform,
}:
rustPlatform.buildRustPackage {
  buildInputs = [
    openssl
  ];
  cargoLock.lockFile = ./Cargo.lock;
  nativeBuildInputs = [
    pkg-config
  ];
  pname = "swww-bing";
  src = ./.;
  version = "2025-02-20";
}
