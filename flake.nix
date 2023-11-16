{
  description = "IogaMaster's Neovim Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... }: utils.lib.eachDefaultSystem (system:
    let
      inherit (nixpkgs) lib;
      pkgs = nixpkgs.legacyPackages.${system};
      runtimeDeps = with pkgs; [ 
        # Tree sitter
        gcc 
        
        # LSP/Linters
        nil 
        statix 
        deadnix 
        manix

        # Telescope
        chafa 
        ffmpegthumbnailer 

        # Misc
        wakatime 
      ];

      nvim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped
        (pkgs.neovimUtils.makeNeovimConfig
          {
            customRC = ''
              set runtimepath^=${./.}
              source ${./.}/init.lua
            '';
          } // {
          wrapperArgs = [
            "--prefix"
            "PATH"
            ":"
            "${lib.makeBinPath runtimeDeps}"
          ];
        });
    in
    {
      overlays = {
        neovim = _: _prev: {
          neovim = nvim;
        };
        default = self.overlays.neovim;
      };

      packages = rec {
        neovim = nvim;
        default = neovim;
      };

      devShells.default = pkgs.mkShell {
        nativeBuildInputs = [
          pkgs.stylua
        ];
      };
    }
  );
}
