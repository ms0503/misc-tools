{
  openssl,
  pkg-config,
  rustPlatform,
}:
let
  cargoToml = builtins.fromTOML (builtins.readFile ./Cargo.toml);
in
rustPlatform.buildRustPackage {
  buildInputs = [
    openssl
  ];
  inherit (cargoToml.package) version;
  cargoLock.lockFile = ./Cargo.lock;
  nativeBuildInputs = [
    pkg-config
  ];
  pname = cargoToml.package.name;
  src = ./.;
}
