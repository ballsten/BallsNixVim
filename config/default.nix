{
  # Import all your configuration modules here
  imports = [ 
    ./bufferline.nix
    ./lsp.nix
    ./lualine.nix
    ./options.nix
    ./treesitter.nix
  ];

  colorschemes.cyberdream.enable = true;
}
