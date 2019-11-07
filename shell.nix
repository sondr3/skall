let
  pkgs = import ./nix/nixpkgs.nix;

  inherit (pkgs)
    stdenv
    ;

  rust = (
    pkgs.rustChannelOf {
      channel = "stable";
    }
  ).rust.override {
    extensions = [
      "clippy-preview"
      "rls-preview"
      "rustfmt-preview"
      "rust-analysis"
      "rust-std"
      "rust-src"
    ];
  };
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    openssl
    pkgconfig
    rust
  ];

  shellHook = ''
    export PATH=$PWD/target/debug:$PATH
  '';
}
