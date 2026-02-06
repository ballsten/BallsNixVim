{ pkgs, ... }:
{
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./keymaps.nix
    ./lsp.nix
    ./lualine.nix
    ./options.nix
    ./snacks.nix
    ./treesitter.nix
  ];

  # set color scheme
  colorschemes.cyberdream.enable = true;

  # install extra packages
  extraPackages = with pkgs; [
    ripgrep
  ];
}
