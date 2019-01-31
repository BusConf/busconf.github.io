with (import <nixpkgs> {});
let
  env = bundlerEnv {
    name = "dx-blog";
    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "dx-blog";
  buildInputs = [env ruby];
  shellHook = ''
    jekyll clean
    jekyll serve --watch --incremental
  '';
}
