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

  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cF";
      action.__raw = "function() require('conform').format = { formatters = { 'injected' }, timeout_ms = 3000 } end";
      options = {
        desc = "Format injected Language";
      };
    }
  ];
}
