_: {
  perSystem =
    { inputs', pkgs, ... }:
    let
      inherit (pkgs) callPackage makeRustPlatform;
    in
    {
      packages =
        let
          rustPlatform = makeRustPlatform {
            cargo = inputs'.fenix.packages.latest.toolchain;
            rustc = inputs'.fenix.packages.latest.toolchain;
          };

        in
        {
          colortool = callPackage ./colortool {
            inherit rustPlatform;
          };
          generatehex = callPackage ./generatehex {
            inherit rustPlatform;
          };
          getcodepoint = callPackage ./getcodepoint {
            inherit rustPlatform;
          };
          getemoji = callPackage ./getemoji {
            inherit rustPlatform;
          };
          skel = callPackage ./skel {
            inherit rustPlatform;
          };
          swww-bing = callPackage ./swww-bing {
            inherit rustPlatform;
          };
          unicodeescape = callPackage ./unicodeescape {
            inherit rustPlatform;
          };
          urlencode = callPackage ./urlencode {
            inherit rustPlatform;
          };
        };
    };
}
