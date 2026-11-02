{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    gcc
    cmake
    ninja
    pkg-config
  ];

  shellHook = ''
    echo "C/C++ development environment activated!"
  '';
}
