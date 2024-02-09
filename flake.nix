{
  # FIXME: actual description
  description = "tmux-sessionizer flake";

  inputs.systems.url = "github:nix-systems/default";

  outputs = { nixpkgs, systems, ... }: let
    forEachSystem = nixpkgs.lib.genAttrs (import systems);
  in {
    overlays.default = final: prev: {
      tmux-sessionizer = final.callPackage ./tmux-sessionizer.nix {};
    };
    packages = forEachSystem (system: {
      default = nixpkgs.legacyPackages.${system}.callPackage ./tmux-sessionizer.nix {};
    });
  };
}
