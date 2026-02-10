{ pkgs, ... }:
{
  # set globals for leader
  globals = {
    mapleader = " ";
    maplocalleader = "\\";
  };

  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./flash.nix
    ./keymaps.nix
    ./lsp.nix
    ./lualine.nix
    ./options.nix
    ./snacks.nix
    ./treesitter.nix
    ./which-key.nix
  ];

  # set color scheme
  colorschemes.cyberdream.enable = true;

  # install extra packages
  extraPackages = with pkgs; [
    fd
    ripgrep
  ];
}
