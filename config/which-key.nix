{
  plugins.which-key = {
    enable = true;
    settings = {
      preset = "helix";
      spec = [
        {
          mode = [
            "n"
            "v"
          ];
          __unkeyed-1 = {
            __unkeyed = "<leader><tab>";
            group = "tabs";
          };
          __unkeyed-2 = {
            __unkeyed = "<leader>c";
            group = "code";
          };
          __unkeyed-3 = {
            __unkeyed = "<leader>d";
            group = "debug";
          };
          __unkeyed-4 = {
            __unkeyed = "<leader>dp";
            group = "profiler";
          };
          __unkeyed-5 = {
            __unkeyed = "<leader>f";
            group = "file/find";
          };
          __unkeyed-6 = {
            __unkeyed = "<leader>g";
            group = "git";
          };
          __unkeyed-7 = {
            __unkeyed = "<leader>gh";
            group = "hunks";
          };
          __unkeyed-8 = {
            __unkeyed = "<leader>q";
            group = "quit/session";
          };
          __unkeyed-9 = {
            __unkeyed = "<leader>s";
            group = "search";
          };
          __unkeyed-10 = {
            __unkeyed = "<leader>u";
            group = "ui";
            icon = {
              icon = "󰙵 ";
              color = "cyan";
            };
          };
          __unkeyed-11 = {
            __unkeyed = "<leader>x";
            group = "diagnostics/quickfix";
            icon = {
              icon = "󱖫 ";
              color = "green";
            };
          };
          __unkeyed-12 = {
            __unkeyed = "[";
            group = "prev";
          };
          __unkeyed-13 = {
            __unkeyed = "]";
            group = "next";
          };
          __unkeyed-14 = {
            __unkeyed = "g";
            group = "goto";
          };
          __unkeyed-15 = {
            __unkeyed = "gs";
            group = "surround";
          };
          __unkeyed-16 = {
            __unkeyed = "z";
            group = "fold";
          };
          __unkeyed-17 = {
            __unkeyed = "<leader>b";
            group = "buffer";
            expand.__raw = ''
              function()
                return require("which-key.extras").expand.buf()
              end
            '';
          };
          __unkeyed-18 = {
            __unkeyed = "<leader>w";
            group = "windows";
            proxy = "<c-w>";
            expand.__raw = ''
              function()
                return require("which-key.extras").expand.win()
              end
            '';
          };
          # better descriptions
          __unkeyed-19 = {
            __unkeyed = "gx";
            desc = "Open with system app";
          };
          # treesitter
          __unkeyed-20 = {
            __unkeyed = "<BS>";
            desc = "Decrement Selection";
            mode = "x";
          };
          __unkeyed-21 = {
            __unkeyed = "<c-space>";
            desc = "Increment Selection";
            mode = [
              "x"
              "n"
            ];
          };
        }
      ];
    };
  };

  # set keymaps
  keymaps = [
    {
      mode = "n";
      key = "<leader>?";
      action.__raw = "function() require('which-key').show { global = false } end";
      options = {
        desc = "Buffer Keymaps (which-key)";
      };
    }
    {
      mode = "n";
      key = "<c-w><space>";
      action.__raw = "function() require('which-key').show { keys = '<c-w>', loop = true } end";
      options = {
        desc = "Window Hydra Mode (which-key)";
      };
    }
  ];
}
