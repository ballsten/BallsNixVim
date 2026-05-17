{
  autoGroups = {
    ballsvim_checktime = {
      clear = true;
    };
    ballsvim_highlight_yank = {
      clear = true;
    };
    ballsvim_resize_splits = {
      clear = true;
    };
    ballsvim_last_loc = {
      clear = true;
    };
  };
  autoCmd = [
    {
      group = "ballsvim_checktime";
      event = [
        "FocusGained"
        "TermClose"
        "TermLeave"
      ];
      callback.__raw = "function()
        if vim.o.buftype ~= 'nofile' then
          vim.cmd('checktime')
        end
      end";
    }
    {
      group = "ballsvim_highlight_yank";
      event = [ "TextYankPost" ];
      callback.__raw = "function()
        (vim.hl or vim.highlight).on_yank()
      end";
    }
    {
      group = "ballsvim_resize_splits";
      event = [ "VimResized" ];
      callback.__raw = "function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd('tabdo wincmd =')
        vim.cmd('tabnext ' .. current_tab)
      end";
    }
    {
      group = "ballsvim_last_loc";
      event = [ "BufReadPost" ];
      callback.__raw = ''
         function(event)
           local exclude = { "gitcommit" }
           local buf = event.buf
           if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].ballsvim_last_loc then
             return
           end
           vim.b[buf].ballsvim_last_loc = true
           local mark = vim.api.nvim_buf_get_mark(buf, [["]])
           local lcount = vim.api.nvim_buf_line_count(buf)
           if mark[1] > 0 and mark[1] <= lcount then
             pcall(vim.api.nvim_win_set_cursor, 0, mark)
           end
        end
      '';
    }
  ];
}
