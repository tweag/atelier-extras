{
  inputs,
  system,
  project,
  shell,
}:
import (if system == "x86_64-darwin" then inputs.nixpkgs-2605 else inputs.nixpkgs) {
  inherit system;
  overlays = [
    inputs.haskell-nix.overlay
    inputs.tricorder.overlays.nix-hpack
    (final: _: {
      atelierProject = final.haskell-nix.hix.project (
        project
        // {
          # uncomment with your current system for `nix flake show` to work:
          # evalSystem = "x86_64-linux";
          inherit shell;
        }
      );
    })

  ];
  inherit (inputs.haskell-nix) config;
}
