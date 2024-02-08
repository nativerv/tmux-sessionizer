{
  # FIXME: actual description
  description = "tmux-sessionizer flake";

  inputs.systems.url = "github:nix-systems/default";

  outputs = { nixpkgs, systems, ... }: let
    forEachSystem = nixpkgs.lib.genAttrs (import systems);
  in {
    packages = forEachSystem (system: {
      default = nixpkgs.legacyPackages.${system}.callPackage ./tmux-sessionizer.nix {};
    });
  };
}
