{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      default_format_opts = {
        timeout_ms = 3000;
        lsp_format = "fallback";
      };
      format_on_save = {
        timeout_ms = 500;
        lsp_format = "fallback";
        formatters_by_ft = { };
      };
      formatters_by_ft = {
        nix = [ "nixfmt" ];
      };
    };
  };
}
