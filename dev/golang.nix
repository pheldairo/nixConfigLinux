{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    go
    gopls
    golangci-lint
    gotools
    delve
  ];

  shellHook = ''
    export GOPATH="$HOME/go"
    export PATH="$GOPATH/bin:$PATH"

    echo "Go development environment activated!"
  '';
}
