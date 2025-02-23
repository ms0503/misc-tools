{
  callPackage,
  lib,
  linkFarm,
  ...
}:
let
  packages = {
    colortool = callPackage ./colortool { };
    generatehex = callPackage ./generatehex { };
    getcodepoint = callPackage ./getcodepoint { };
    getemoji = callPackage ./getemoji { };
    matrics = callPackage ./matrics { };
    skel = callPackage ./skel { };
    swww-bing = callPackage ./swww-bing { };
    unicodeescape = callPackage ./unicodeescape { };
    urlencode = callPackage ./urlencode { };
  };
in
packages
// {
  default = linkFarm "all" (lib.mapAttrsToList (name: path: { inherit name path; }) packages);
}
