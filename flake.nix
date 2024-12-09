{
  description = "Build SiSpeed NanoKVM firmware from source";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = rec {
          nanokvm = pkgs.callPackage ./nanokvm.nix { };
          default = nanokvm;
        };
      }
    );
}
