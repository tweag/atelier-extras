{
  inputs,
  system,
  self,
  # GHC version to use across all tools and the project
  compiler-nix-name,
}:
let
  project = import ./project.nix {
    inherit compiler-nix-name inputs;
  };
  shell = import ./shell.nix { inherit pkgs checks; };
  pkgs = import ./pkgs.nix {
    inherit
      system
      inputs
      project
      shell
      ;
  };
  inherit (pkgs) lib;
  flake = pkgs.atelierProject.flake { };
  checks = import ./checks.nix {
    inherit
      system
      pkgs
      inputs
      compiler-nix-name
      self
      ;
  };
  docs = import ./docs.nix { inherit flake; };
  sdists = import ./sdists.nix { inherit pkgs; };
  apps = import ./apps.nix { inherit pkgs compiler-nix-name; };
in
builtins.foldl' lib.recursiveUpdate { } [
  flake
  docs
  sdists
  checks
  apps
  {
    legacyPackages = pkgs;
  }
]
