let
  pkgs = import ./nix/nixpkgs.nix;

  inherit (pkgs) stdenv;

  rust = (
    pkgs.rustChannelOf {
      channel = "stable";
    }
  ).rust.override {
    extensions = [
      "clippy-preview"
      "rustfmt-preview"
      "rust-analysis"
      "rust-std"
      "rust-src"
    ];
  };
in
pkgs.gcc9Stdenv.mkDerivation {
  name = "skall";
  buildInputs = with pkgs; [
    pkgconfig
    lld
    rust
  ];

  shellHook = ''
    export PATH=$PWD/target/debug:$PATH
  '';

  # Use LLD for linking, it is much faster than the GCC linker
  RUSTFLAGS = "-C link-arg=-fuse-ld=lld";
}
