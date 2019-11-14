let
  pkgs = import ./nix/nixpkgs.nix;

  inherit (pkgs) stdenv;
in
pkgs.gcc9Stdenv.mkDerivation {
  name = "skall";
  buildInputs = with pkgs; [
    pkgconfig
    lld
    pkgs.latest.rustChannels.stable.rust
  ];

  shellHook = ''
    export PATH=$PWD/target/debug:$PATH
  '';

  # Use LLD for linking, it is much faster than the GCC linker
  RUSTFLAGS = "-C link-arg=-fuse-ld=lld";
}
