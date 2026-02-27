{
  plugins = {
    bufferline = {
      enable = true;
      settings = {
        options = {
          close_command.__raw = "function(n) Snacks.bufdelete(n) end";
          right_mouse_command.__raw = "function(n) Snacks.bufdelete(n) end";
          diagnostics = "nvim_lsp";
          always_show_bufferline = false;
          diagnostics_indicator.__raw = "function(_, _, diag)
            local icons = {
              Error = ' ',
              Warn = ' ',
              Hint = ' ',
              Info = ' ',
            }
            local ret = (diag.error and icons.Error .. diag.error .. ' ' or '')
              .. (diag.warning and icons.Warn .. diag.warning or '')
            return vim.trim(ret)
          end";
          offsets = {
            __unkeyed-1 = {
              filetype = "neo-tree";
              text = "Neo-tree";
              highlight = "Directory";
              text_align = "left";
            };
            __unkeyed-2 = {
              filetype = "snacks_layout_box";
            };
          };
          get_element_icon.__raw = "function(element)
            local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
            return icon, hl
          end";
        };
      };
    };
    web-devicons.enable = true;
  };
}
