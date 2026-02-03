{ pkgs, ...}:
{
  # Import all your configuration modules here
  imports = [ 
    ./bufferline.nix
    ./lsp.nix
    ./lualine.nix
    ./options.nix
    ./snacks.nix
    ./treesitter.nix
  ];

  colorschemes.cyberdream.enable = true;

  extraPackages = with pkgs; [
    ripgrep
  ];
}
