{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    python3
  ];

  shellHook = ''
    echo "Python development environment activated!"
  '';
}
