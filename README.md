# nixConfigLinux

NixOS flake for a ThinkPad T14s (Intel), tracking **nixos-unstable** (26.11).

## Layout

```
flake.nix                      inputs, the t14s system, devShells
hosts/t14s/configuration.nix   system config
hosts/t14s/hardware-configuration.nix
home/delphy.nix                Home Manager: user apps, zsh, Zen browser
home/nixvim/                   Neovim via nixvim (options, plugins, LSP, keymaps)
dev/                           per-language dev shells
```

## System

- **Boot:** Limine with Secure Boot (sbctl), plus a Windows dual-boot entry; latest kernel; evdi for DisplayLink.
- **Desktop:** GNOME on GDM, plus niri with DankMaterialShell; XWayland via xwayland-satellite.
- **Hardware:** PipeWire, Bluetooth, fingerprint reader (fprintd), thermald, power-profiles-daemon, fwupd, fstrim.
- **Gaming:** Steam with gamescope, gamemode, MangoHud, lsfg-vk, Wine.
- **Other:** Docker, Waydroid, Flatpak (apps declared in home via nix-flatpak), KDE Connect, ProtonVPN/WireGuard. Firewall on, SSH off.
- **Nix:** flakes enabled, weekly GC (older than 7 days), store auto-optimise.

## Home (delphy)

zsh + oh-my-zsh + powerlevel10k, Zen browser (default) and Chromium, Neovim (nixvim with Catppuccin, Telescope,
Neo-tree, Treesitter, LSP, blink-cmp, Snacks, lazygit), plus desktop apps, games and emulators.

## Usage

```sh
sudo nixos-rebuild switch --flake .#nix   # apply the system + home config
nix flake update                           # update inputs
nix develop .#golang                       # golang (default) | rust-learning | cpp | python
```
