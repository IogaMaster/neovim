{
  lib,
  wrapNeovimUnstable,
  neovim-unwrapped,
  neovimUtils,
  lua5_1,
  luarocks,
  clang,
  pkg-config,
  cargo,
  bundled ? true,
}: let
  config = let
    extraPackages = [
      # Rocks.nvim deps
      lua5_1
      luarocks
      clang
      pkg-config
      cargo
    ];
  in
    neovimUtils.makeNeovimConfig
    {
      withPython3 = false;
      withRuby = false;
      withNodeJs = false;

      extraLuaPackages = p:
        with p; [
          magick
        ];

      inherit extraPackages;

      customRC =
        if bundled
        then ''
          set runtimepath^=${../../.}
          source ${../../.}/init.lua
        ''
        else ''
          set runtimepath^=~/.nvim
          set runtimepath-=~/.config/nvim
          source ~/.nvim/init.lua
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
  wrapNeovimUnstable neovim-unwrapped config
