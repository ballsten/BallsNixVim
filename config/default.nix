{
  # Import all your configuration modules here
  imports = [ 
    ./bufferline.nix
    ./lsp.nix
    ./lualine.nix
    ./treesitter.nix
  ];

  colorschemes.cyberdream.enable = true;
}
