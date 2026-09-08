{
  compiler-nix-name,
  inputs,
}:
let
  component = {
    # Treat warnings as errors in Nix builds (CI), but not in local dev.
    # Applied to every first-party package.
    ghcOptions = [ "-Werror" ];
    # Make generated documentation suitable for upload to Hackage.
    setupHaddockFlags = [ "--for-hackage" ];
  };
in
{
  inherit compiler-nix-name;
  src = ../.;

  # Add tmp-postgres from flake input
  cabalProjectLocal = import ./tmp-postgres.nix { inherit inputs; };

  # Package-specific configuration
  modules = [
    {
      # Build Haddock (including hyperlinked source) for all packages
      doHaddock = true;

      packages = {
        # Disable tests for tmp-postgres
        tmp-postgres.doCheck = false;

        atelier-db = component;
        atelier-testing = component;
        atelier-monitoring = component;
      };
    }
  ];
}
