{
  description = "IogaMaster's Neovim Configuration";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixpkgs-unstable;
    utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, utils, ... }: utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      nvim = pkgs.neovim.override {
        configure = {
          customRC = ''
            set runtimepath^=${./.}
            source ${./.}/init.lua
          '';
        };
      };
    in
    {
      overlay = final: prev: {
        neovim = nvim;
      };
      packages = rec {
        neovim = nvim;
        default = neovim;
      };

      devShells.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          neovim
        ];
      };
    }
  );
}
