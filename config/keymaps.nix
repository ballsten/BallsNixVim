{
  keymaps = [
    # better up down
    {
      mode = [
        "n"
        "x"
      ];
      key = "j";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        desc = "Down";
        expr = true;
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<Down>";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        desc = "Down";
        expr = true;
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "k";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        desc = "Up";
        expr = true;
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<Up>";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        desc = "Up";
        expr = true;
        silent = true;
      };
    }

    # Move to window using the <ctrl> hjkl keys
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        desc = "Go to Left Window";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        desc = "Go to Lower Window";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        desc = "Go to Upper Window";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        desc = "Go to Right Window";
        remap = true;
      };
    }

    # Resize window using <ctrl> arrow keys
    {
      mode = "n";
      key = "<C-Up>";
      action = "<cmd>resize +2<cr>";
      options = {
        desc = "Increase Window Height";
      };
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = "<cmd>resize -2<cr>";
      options = {
        desc = "Decrease Window Height";
      };
    }
    {
      mode = "n";
      key = "<C-Left>";
      action = "<cmd>vertical resize +2<cr>";
      options = {
        desc = "Increase Window Width";
      };
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = "<cmd>vertical resize -2<cr>";
      options = {
        desc = "Decrease Window Width";
      };
    }

    # Move Lines
    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>execute 'move .+' . v:count1<cr>==";
      options = {
        desc = "Move Down";
      };
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==";
      options = {
        desc = "Move Up";
      };
    }
    {
      mode = "i";
      key = "<A-j>";
      action = "<esc><cmd>m .+1<cr>==gi";
      options = {
        desc = "Move Down";
      };
    }
    {
      mode = "i";
      key = "<A-k>";
      action = "<esc><cmd>m .-2<cr>==gi";
      options = {
        desc = "Move Up";
      };
    }
    {
      mode = "v";
      key = "<A-j>";
      action = ":<C-u>execute \"'<;'>move '>+\" . v:count1<cr>gv=gv";
      options = {
        desc = "Move Down";
      };
    }
    {
      mode = "v";
      key = "<A-k>";
      action = ":<C-u>execute \"'<;'>move '<-\" . (v:count1 + 1)<cr>gv=gv";
      options = {
        desc = "Move Up";
      };
    }

    # buffers
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>bprevious<cr>";
      options = {
        desc = "Prev Buffer";
      };
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>bnext<cr>";
      options = {
        desc = "Next Buffer";
      };
    }
    {
      mode = "n";
      key = "[b";
      action = "<cmd>bprevious<cr>";
      options = {
        desc = "Prev Buffer";
      };
    }
    {
      mode = "n";
      key = "]b";
      action = "<cmd>bnext<cr>";
      options = {
        desc = "Next Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>bb";
      action = "<cmd>e #<cr>";
      options = {
        desc = "Switch to Other Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>`";
      action = "<cmd>e #<cr>";
      options = {
        desc = "Switch to Other Buffer";
      };
    }

    # TODO: review
    # Clear search and stop snippet on escape
    #
    # map({ "i", "n", "s" }, "<esc>", function()
    #   vim.cmd("noh")
    #   LazyVim.cmp.actions.snippet_stop()
    #   return "<esc>"
    # end, { expr = true, desc = "Escape and Clear hlsearch" })
    # ]]

    # Clear search, diff update and redraw
    # taken from runtime/lua/_editor.lua
    {
      mode = "n";
      key = "<leader>ur";
      action = "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>";
      options = {
        desc = "Redraw / Clear hlsearch / Diff Update";
      };
    }

    # https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
    {
      mode = "n";
      key = "n";
      action = "'Nn'[v:searchforward].'zv'";
      options = {
        expr = true;
        desc = "Next Search Result";
      };
    }
    {
      mode = "x";
      key = "n";
      action = "'Nn'[v:searchforward]";
      options = {
        expr = true;
        desc = "Next Search Result";
      };
    }
    {
      mode = "o";
      key = "n";
      action = "'Nn'[v:searchforward]";
      options = {
        expr = true;
        desc = "Next Search Result";
      };
    }
    {
      mode = "n";
      key = "N";
      action = "'nN'[v:searchforward].'zv'";
      options = {
        expr = true;
        desc = "Prev Search Result";
      };
    }
    {
      mode = "x";
      key = "N";
      action = "'nN'[v:searchforward]";
      options = {
        expr = true;
        desc = "Prev Search Result";
      };
    }
    {
      mode = "o";
      key = "N";
      action = "'nN'[v:searchforward]";
      options = {
        expr = true;
        desc = "Prev Search Result";
      };
    }

    # Add undo break-points
    {
      mode = "i";
      key = ";";
      action = ";<c-g>u";
    }
    {
      mode = "i";
      key = ".";
      action = ".<c-g>u";
    }
    {
      mode = "i";
      key = ";";
      action = ";<c-g>u";
    }

    # save file
    {
      mode = [
        "i"
        "x"
        "n"
        "s"
      ];
      key = "<C-s>";
      action = "<cmd>w<cr><esc>";
      options = {
        desc = "Save File";
      };
    }

    #keywordprg
    {
      mode = "n";
      key = "<leader>K";
      action = "<cmd>norm! K<cr>";
      options = {
        desc = "Keywordprg";
      };
    }

    # better indenting
    {
      mode = "v";
      key = "<";
      action = "<gv";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
    }

    # commenting
    {
      mode = "n";
      key = "gco";
      action = "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>";
      options = {
        desc = "Add Comment Below";
      };
    }
    {
      mode = "n";
      key = "gcO";
      action = "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>";
      options = {
        desc = "Add Comment Above";
      };
    }

    # new file
    {
      mode = "n";
      key = "<leader>fn";
      action = "<cmd>enew<cr>";
      options = {
        desc = "New File";
      };
    }

    # location list
    {
      mode = "n";
      key = "<leader>xl";
      action.__raw = "function()
        local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
        if not success and err then
          vim.notify(err, vim.log.levels.ERROR)
        end
      end";
      options = {
        desc = "Location List";
      };
    }

    # quickfix list
    {
      mode = "n";
      key = "<leader>xq";
      action.__raw = "function()
          local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
          if not success and err then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end";
      options = {
        desc = "Quickfix List";
      };
    }

    {
      mode = "n";
      key = "[q";
      action = "vim.cmd.cprev";
      options = {
        desc = "Previous Quickfix";
      };
    }
    {
      mode = "n";
      key = "]q";
      action = "vim.cmd.cnext";
      options = {
        desc = "Next Quickfix";
      };
    }

    # -- formatting
    # -- TODO: evaluate
    # --[[
    # map({ "n", "v" }, "<leader>cf", function()
    # LazyVim.format({ force = true })
    # end, { desc = "Format" })
    # ]]
    # --

    # -- diagnostic
    # -- TODO: do I need to do anything here?
    # local diagnostic_goto = function(next, severity)
    #   local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    #   severity = severity and vim.diagnostic.severity[severity] or nil
    #   return function()
    #     go { severity = severity }
    #   end
    # end
    # map('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
    # map('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
    # map('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
    # map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
    # map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
    # map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
    # map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

    # quit
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>qa<cr>";
      options = {
        desc = "Quit All";
      };
    }

    # highlights under cursor
    {
      mode = "n";
      key = "<leader>ui";
      action = "vim.show_pos";
      options = {
        desc = "Inspect Pos";
      };
    }
    {
      mode = "n";
      key = "<leader>uI";
      action.__raw = "function() vim.treesitter.inspect_tree() vim.api.nvim_input(\"I\") end";
      options = {
        desc = "Inspect Tree";
      };
    }

    # floating terminal
    # TODO: Snacks
    # map("n", "<leader>fT", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
    # map("n", "<leader>ft", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
    # map("n", "<c-/>",      function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
    # map("n", "<c-_>",      function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "which_key_ignore" })

    # Terminal Mappings
    {
      mode = "t";
      key = "<C-/>";
      action = "<cmd>close<cr>";
      options = {
        desc = "Hide Terminal";
      };
    }
    {
      mode = "t";
      key = "<c-_>";
      action = "<cmd>close<cr>";
      options = {
        desc = "which_key_ignore";
      };
    }

    # windows
    {
      mode = "n";
      key = "<leader>-";
      action = "<C-W>s";
      options = {
        desc = "Split Window Below";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>|";
      action = "<C-W>v";
      options = {
        desc = "Split Window Right";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-W>c";
      options = {
        desc = "Delete Window";
        remap = true;
      };
    }

    # TOOD: Snacks
    # Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
    # Snacks.toggle.zen():map("<leader>uz")

    # tabs
    {
      mode = "n";
      key = "<leader><tab>l";
      action = "<cmd>tablast<cr>";
      options = {
        desc = "Last Tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>o";
      action = "<cmd>tabonly<cr>";
      options = {
        desc = "Close Other Tabs";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>f";
      action = "<cmd>tabfirst<cr>";
      options = {
        desc = "First Tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab><tab>";
      action = "<cmd>tabnew<cr>";
      options = {
        desc = "New Tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>]";
      action = "<cmd>tabnext<cr>";
      options = {
        desc = "Next Tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>d";
      action = "<cmd>tabclose<cr>";
      options = {
        desc = "Close Tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>[";
      action = "<cmd>tabprevious<cr>";
      options = {
        desc = "Previous Tab";
      };
    }
  ];
}
