{
  plugins.snacks = {
    enable = true;
    luaConfig.pre = ''
      -- Terminal Mappings
      local function term_nav(dir)
        ---@param self snacks.terminal
        return function(self)
          return self:is_floating() and '<c-' .. dir .. '>' or vim.schedule(function()
            vim.cmd.wincmd(dir)
          end)
        end
      end
    '';
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
      quickfile = {
        enabled = true;
      };
      scope = {
        enabled = true;
      };
      scroll = {
        enabled = true;
      };
      statuscolumn = {
        enabled = true;
      };
      terminal = {
        win = {
          keys = {
            nav_h = {
              __unkeyed-1 = "<C-h>";
              __unkeyed-2.__raw = "term_nav('h')";
              desc = "Go to Left Window";
              expr = true;
              mode = "t";
            };
            nav_j = {
              __unkeyed-1 = "<C-j>";
              __unkeyed-2.__raw = "term_nav('j')";
              desc = "Go to Lower Window";
              expr = true;
              mode = "t";
            };
            nav_k = {
              __unkeyed-1 = "<C-k>";
              __unkeyed-2.__raw = "term_nav('k')";
              desc = "Go to Upper Window";
              expr = true;
              mode = "t";
            };
            nav_l = {
              __unkeyed-1 = "<C-l>";
              __unkeyed-2.__raw = "term_nav('l')";
              desc = "Go to Right Window";
              expr = true;
              mode = "t";
            };
          };
        };
      };
      toggle = {
        enabled = true;
      };
      words = {
        enabled = true;
      };
    };
  };

  # keymaps
  # buffers
  keymaps = [
    {
      mode = "n";
      key = "<leader>bd";
      action.__raw = "function() Snacks.bufdelete() end";
      options = {
        desc = "Delete Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>bo";
      action.__raw = "function() Snacks.bufdelete.other() end";
      options = {
        desc = "Delete Other Buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>bD";
      action = "<cmd>:bd<cr>";
      options = {
        desc = "Delete Buffer and Window";
      };
    }

    # toggle options
    # TODO not sure about these
    # LazyVim.format.snacks_toggle():map("<leader>uf")
    # LazyVim.format.snacks_toggle(true):map("<leader>uF")
    # Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    # Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    # Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    # Snacks.toggle.diagnostics():map("<leader>ud")
    # Snacks.toggle.line_number():map("<leader>ul")
    # Snacks.toggle
    #   .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" })
    #   :map("<leader>uc")
    # Snacks.toggle
    #   .option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" })
    #   :map("<leader>uA")
    # Snacks.toggle.treesitter():map("<leader>uT")
    # Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
    # Snacks.toggle.dim():map("<leader>uD")
    # Snacks.toggle.animate():map("<leader>ua")
    # Snacks.toggle.indent():map("<leader>ug")
    # Snacks.toggle.scroll():map("<leader>uS")
    # Snacks.toggle.profiler():map("<leader>dpp")
    # Snacks.toggle.profiler_highlights():map("<leader>dph")
    # if vim.lsp.inlay_hint then
    #   Snacks.toggle.inlay_hints():map("<leader>uh")
    # end
    # Snacks.toggle({
    #   name = "Git Signs",
    #   get = function()
    #     return require("gitsigns.config").config.signcolumn
    #   end,
    #   set = function(state)
    #     require("gitsigns").toggle_signs(state)
    #   end,
    # }):map("<leader>uG")
    #
    # # lazygit
    # # stylua: ignore start
    # if vim.fn.executable("lazygit") == 1 then
    #   map("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
    #   map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Current File History" })
    #   map("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
    # end

    {
      mode = "n";
      key = "<leader>gb";
      action.__raw = "function() Snacks.picker.git_log_line() end";
      options = {
        desc = "Git Blame Line";
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>gB";
      action.__raw = "function() Snacks.gitbrowse() end";
      options = {
        desc = "Git Browse (open)";
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>gY";
      action.__raw = "function() Snacks.gitbrowse {
  open = function(url) vim.fn.setreg('+', url) end,
  notify = false,
} end";
      options = {
        desc = "Git Browse (copy)";
      };
    }

    # terimal keys
    {
      mode = "n";
      key = "<leader>.";
      action.__raw = "function() Snacks.scratch() end";
      options = {
        desc = "Toggle Scratch Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>S";
      action.__raw = "function() Snacks.scratch.select() end";
      options = {
        desc = "Select Scratch Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>dps";
      action.__raw = "function() Snacks.profiler.scratch() end";
      options = {
        desc = "Profiler Scratch Buffer";
      };
    }

    # picker keys
    {
      mode = "n";
      key = "<leader>,";
      action.__raw = "function() Snacks.picker.buffers() end";
      options = {
        desc = "Buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>/";
      action.__raw = "function() Snacks.picker.grep() end";
      options = {
        desc = "Grep";
      };
    }
    {
      mode = "n";
      key = "<leader>:";
      action.__raw = "function() Snacks.picker.command_history() end";
      options = {
        desc = "Command History";
      };
    }
    {
      mode = "n";
      key = "<leader><space>";
      action.__raw = "function() Snacks.picker.smart() end";
      options = {
        desc = "Smart Find Files";
      };
    }
    {
      mode = "n";
      key = "<leader>n";
      action.__raw = "function() Snacks.picker.notifications() end";
      options = {
        desc = "Notification History";
      };
    }
    # explorer
    {
      mode = "n";
      key = "<leader>fe";
      action.__raw = "function() Snacks.explorer() end";
      options = {
        desc = "Explorer Snacks";
      };
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "<leader>fe";
      options = {
        desc = "Explorer Snacks";
      };
    }
    # find
    {
      mode = "n";
      key = "<leader>fb";
      action.__raw = "function() Snacks.picker.buffers() end";
      options = {
        desc = "Buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>fB";
      action.__raw = "function() Snacks.picker.buffers({ hidden = true, nofile = true}) end";
      options = {
        desc = "Buffers (all)";
      };
    }
    {
      mode = "n";
      key = "<leader>ff";
      action.__raw = "function() Snacks.picker.files() end";
      options = {
        desc = "Find Files (Root Dir)";
      };
    }
    {
      mode = "n";
      key = "<leader>fg";
      action.__raw = "function() Snacks.picker.git_files() end";
      options = {
        desc = "Find Files (git-files)";
      };
    }
    {
      mode = "n";
      key = "<leader>fr";
      action.__raw = "function() Snacks.picker.recent() end";
      options = {
        desc = "Recent";
      };
    }
    {
      mode = "n";
      key = "<leader>fp";
      action.__raw = "function() Snacks.picker.projects() end";
      options = {
        desc = "Projects";
      };
    }
    # git
    {
      mode = "n";
      key = "<leader>gd";
      action.__raw = "function() Snacks.picker.git_diff() end";
      options = {
        desc = "Git Diff (hunks)";
      };
    }
    {
      mode = "n";
      key = "<leader>gs";
      action.__raw = "function() Snacks.picker.git_status() end";
      options = {
        desc = "Git Status";
      };
    }
    {
      mode = "n";
      key = "<leader>gS";
      action.__raw = "function() Snacks.picker.git_stash() end";
      options = {
        desc = "Git Stash";
      };
    }
    # Grep
    {
      mode = "n";
      key = "<leader>sb";
      action.__raw = "function() Snacks.picker.lines() end";
      options = {
        desc = "Buffer Lines";
      };
    }
    {
      mode = "n";
      key = "<leader>sB";
      action.__raw = "function() Snacks.picker.grep_buffers() end";
      options = {
        desc = "Grep Open Buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>sg";
      action.__raw = "function() Snacks.picker.grep() end";
      options = {
        desc = "Grep";
      };
    }
    {
      mode = "n";
      key = "<leader>sp";
      action.__raw = "function() Snacks.picker.lazy() end";
      options = {
        desc = "Search for Plugin Spec";
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>sw";
      action.__raw = "function() Snacks.picker.grep_word() end";
      options = {
        desc = "Visual selection or word";
      };
    }
    # search
    {
      mode = "n";
      key = "<leader>s\"";
      action.__raw = "function() Snacks.picker.registers() end";
      options = {
        desc = "Registers";
      };
    }
    {
      mode = "n";
      key = "<leader>s/";
      action.__raw = "function() Snacks.picker.search_history() end";
      options = {
        desc = "Search History";
      };
    }
    {
      mode = "n";
      key = "<leader>sa";
      action.__raw = "function() Snacks.picker.autocmds() end";
      options = {
        desc = "Autocmds";
      };
    }
    {
      mode = "n";
      key = "<leader>sc";
      action.__raw = "function() Snacks.picker.command_history() end";
      options = {
        desc = "Command History";
      };
    }
    {
      mode = "n";
      key = "<leader>sC";
      action.__raw = "function() Snacks.picker.commands() end";
      options = {
        desc = "Commands";
      };
    }
    {
      mode = "n";
      key = "<leader>sd";
      action.__raw = "function() Snacks.picker.diagnostics() end";
      options = {
        desc = "Diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>sD";
      action.__raw = "function() Snacks.picker.diagnostics_buffer() end";
      options = {
        desc = "Buffer Diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>sh";
      action.__raw = "function() Snacks.picker.help() end";
      options = {
        desc = "Help Pages";
      };
    }
    {
      mode = "n";
      key = "<leader>sH";
      action.__raw = "function() Snacks.picker.highlights() end";
      options = {
        desc = "Highlights";
      };
    }
    {
      mode = "n";
      key = "<leader>si";
      action.__raw = "function() Snacks.picker.icons() end";
      options = {
        desc = "Icons";
      };
    }
    {
      mode = "n";
      key = "<leader>sj";
      action.__raw = "function() Snacks.picker.jumps() end";
      options = {
        desc = "Jumps";
      };
    }
    {
      mode = "n";
      key = "<leader>sk";
      action.__raw = "function() Snacks.picker.keymaps() end";
      options = {
        desc = "Keymaps";
      };
    }
    {
      mode = "n";
      key = "<leader>sl";
      action.__raw = "function() Snacks.picker.loclist() end";
      options = {
        desc = "Location List";
      };
    }
    {
      mode = "n";
      key = "<leader>sM";
      action.__raw = "function() Snacks.picker.man() end";
      options = {
        desc = "Man Pages";
      };
    }
    {
      mode = "n";
      key = "<leader>sm";
      action.__raw = "function() Snacks.picker.marks() end";
      options = {
        desc = "Marks";
      };
    }
    {
      mode = "n";
      key = "<leader>sR";
      action.__raw = "function() Snacks.picker.resume() end";
      options = {
        desc = "Resume";
      };
    }
    {
      mode = "n";
      key = "<leader>sq";
      action.__raw = "function() Snacks.picker.qflist() end";
      options = {
        desc = "Quickfix List";
      };
    }
    {
      mode = "n";
      key = "<leader>su";
      action.__raw = "function() Snacks.picker.undo() end";
      options = {
        desc = "Undotree";
      };
    }
    # ui
    {
      mode = "n";
      key = "<leader>uC";
      action.__raw = "function() Snacks.picker.colorschemes() end";
      options = {
        desc = "Colorschemes";
      };
    }
  ];
}
