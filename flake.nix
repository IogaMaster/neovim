{
  description = "IogaMaster's Neovim Configuration";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = {nixpkgs, ...}: let
    inherit (nixpkgs) lib;
    forAllSystems = function:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
      ] (system: function nixpkgs.legacyPackages.${system});
  in rec {
    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          alejandra
          stylua
        ];
      };
    });

    packages = forAllSystems (pkgs: rec {
      neovim = let
        config = let
          extraPackages = with pkgs; [
            # Rocks.nvim deps
            lua5_1
            luarocks
            clang
            pkg-config
            cargo
          ];
        in
          pkgs.neovimUtils.makeNeovimConfig
          {
            withPython3 = false;
            withRuby = false;
            withNodeJs = false;

            extraLuaPackages = p:
              with p; [
                magick
              ];

            inherit extraPackages;
            customRC = ''
              set runtimepath^=$HOME/.nvim
              set runtimepath-=~/.config/nvim

              source $HOME/.nvim/init.lua
            '';
          }
          // {
            wrapperArgs = [
              "--prefix"
              "PATH"
              ":"
              "${lib.makeBinPath extraPackages}"
            ];
          };
      in
        pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped config;
      default = neovim;
    });
  };
}
