{ callPackage, ... }:
{
  colortool = callPackage ./colortool { };
  generatehex = callPackage ./generatehex { };
  getcodepoint = callPackage ./getcodepoint { };
  getemoji = callPackage ./getemoji { };
  matrics = callPackage ./matrics { };
  skel = callPackage ./skel { };
  swww-bing = callPackage ./swww-bing { };
  unicodeescape = callPackage ./unicodeescape { };
  urlencode = callPackage ./urlencode { };
}
# vim: et sts=2 sw=2 ts=2
