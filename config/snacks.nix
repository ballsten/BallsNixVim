{
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile = {
        enabled = true;
      };
      dashboard = {
        enabled = true;
        preset = {
          header = ''
            ███████████            ████  ████          █████   █████  ███                 
            ░░███░░░░░███          ░░███ ░░███         ░░███   ░░███  ░░░                 
            ░███    ░███  ██████   ░███  ░███   █████  ░███    ░███  ████  █████████████  
            ░██████████  ░░░░░███  ░███  ░███  ███░░   ░███    ░███ ░░███ ░░███░░███░░███ 
            ░███░░░░░███  ███████  ░███  ░███ ░░█████  ░░███   ███   ░███  ░███ ░███ ░███ 
            ░███    ░███ ███░░███  ░███  ░███  ░░░░███  ░░░█████░    ░███  ░███ ░███ ░███ 
            ███████████ ░░████████ █████ █████ ██████     ░░███      █████ █████░███ █████
            ░░░░░░░░░░░   ░░░░░░░░ ░░░░░ ░░░░░ ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░'';

          keys = [
            {
              icon = " ";
              key = "f";
              desc = "Find File";
              action = ":lua Snacks.dashboard.pick('files')";
            }
            {
              icon = " ";
              key = "n";
              desc = "New File";
              action = ":ene | startinsert";
            }
            {
              icon = " ";
              key = "g";
              desc = "Find Text";
              action = ":lua Snacks.dashboard.pick('live_grep')";
            }
            {
              icon = " ";
              key = "r";
              desc = "Recent Files";
              action = ":lua Snacks.dashboard.pick('oldfiles')";
            }
            {
              icon = " ";
              key = "H";
              desc = "Check Health";
              action = ":checkhealth";
            }
            {
              icon = " ";
              key = "q";
              desc = "Quit";
              action = ":qa";
            }
          ];
        };
        sections = [
          { section = "header"; }
          { section = "keys"; }
        ];
      };
      explorer = {
        replace_netrw = true;
      };
      indent = {
        enabled = true;
      };
      notifier = {
        enabled = true;
      };
      picker = {
        win = {
          input = {
            keys = {
              "<a-c>" = {
                __unkeyed-1 = "toggle_cwd";
                mode = [
                  "n"
                  "i"
                ];
              };
              "<a-s>" = {
                __unkeyed-1 = "flash";
                mode = [
                  "n"
                  "i"
                ];
              };
              "s" = {
                __unkeyed-1 = "flash";
              };
              "<a-t>" = {
                __unkeyed = "trouble_open";
                mode = [
                  "n"
                  "i"
                ];
              };
            };
          };
        };
        actions = {
          flash.__raw = "function(picker)
            require('flash').jump {
              pattern = '^',
              label = { after = { 0, 0 } },
              search = {
                mode = 'search',
                exclude = {
                  function(win)
                    return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= 'snacks_picker_list'
                  end,
                },
              },
              action = function(match)
                local idx = picker.list:row2idx(match.pos[1])
                picker.list:_move(idx, true, true)
              end,
            }
          end,
          ---@param p snacks.Picker
          toggle_cwd = function(p)
            local cwd = vim.fs.normalize((vim.uv or vim.loop).cwd() or '.')
            p:set_cwd(cwd)
            p:find()
          end,
          trouble_open = function(...)
            return require('trouble.sources.snacks').actions.trouble_open.action(...)
          end";
        };
      };
    };
  };
}
