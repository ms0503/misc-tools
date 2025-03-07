{ callPackage, ... }:
{
  colortool = callPackage ./colortool { };
  generatehex = callPackage ./generatehex { };
  getcodepoint = callPackage ./getcodepoint { };
  getemoji = callPackage ./getemoji { };
  skel = callPackage ./skel { };
  swww-bing = callPackage ./swww-bing { };
  unicodeescape = callPackage ./unicodeescape { };
  urlencode = callPackage ./urlencode { };
}
