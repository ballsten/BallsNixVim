{ pkgs, ... }:
{
  # set globals for leader
  globals = {
    mapleader = " ";
    maplocalleader = "\\";
  };

  # Import all your configuration modules here
  imports = [
    ./blink-cmp.nix
    ./bufferline.nix
    ./conform.nix
    ./flash.nix
    ./keymaps.nix
    ./gitsigns.nix
    ./lsp.nix
    ./lualine.nix
    ./mini.nix
    ./noice.nix
    ./options.nix
    ./snacks.nix
    ./todo-comments.nix
    ./treesitter.nix
    ./trouble.nix
    ./ts-comments.nix
    ./which-key.nix
  ];

  # set color scheme
  colorschemes.cyberdream.enable = true;

  # install extra packages
  extraPackages = with pkgs; [
    fd
    ripgrep
    nixfmt
  ];
}
