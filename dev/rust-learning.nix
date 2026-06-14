{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer

    rustlings

    bacon
    cargo-watch
  ];

  shellHook = ''
    echo "This is Rust specifically for learning. Run: rustlings init to get started"
  '';
}
