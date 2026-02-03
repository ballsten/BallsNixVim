{
  opts = {
    autowrite = true;
    completeopt = "menu,menuone,noselect";
    conceallevel = 2; # Hide * markup for bold and italic, but not markers with substitutions
    confirm = true; # Confirm to save changes before exiting modified buffer
    cursorline = true; # Enable highlighting of the current line
    expandtab = true; # Use spaces instead of tabs
    fillchars = {
      foldopen = "";
      foldclose = "";
      fold = " ";
      foldsep = " ";
      diff = "╱";
      eob = " ";
    };
    foldlevel = 99;
    formatexpr = "v:lua.require'conform'.formatexpr()";
    formatoptions = "jcroqlnt";
    grepformat = "%f:%l:%c:%m";
    grepprg = "rg #vimgrep";
    ignorecase = true; # Ignore case
    inccommand = "nosplit"; # preview incremental substitute
    jumpoptions = "view";
    laststatus = 3; # global statusline
    linebreak = true; # Wrap lines at convenient points
    list = true; # Show some invisible characters (tabs...
    mouse = "a"; # Enable mouse mode
    number = true; # Print line number
    pumblend = 10; # Popup blend
    pumheight = 10; # Maximum number of entries in a popup
    relativenumber = true; # Relative line numbers
    ruler = false; # Disable the default ruler
    scrolloff = 4; # Lines of context
    # TODO
    # sessionoptions = { "buffers" "curdir" "tabpages" "winsize" "help" "globals" "skiprtp" "folds"};
    shiftround = true; # Round indent
    shiftwidth = 2; # Size of an indent
    # TODO
    # shortmess:append { W = true, I = true, c = true, C = true }
    showmode = false; # Dont show mode since we have a statusline
    sidescrolloff = 8; # Columns of context
    signcolumn = "yes"; # Always show the signcolumn, otherwise it would shift the text each time
    smartcase = true; # Don"t ignore case with capitals
    smartindent = true; # Insert indents automatically
    spelllang = [ "en" ];
    splitbelow = true; # Put new windows below current
    splitkeep = "screen";
    splitright = true; # Put new windows right of current
    tabstop = 2; # Number of spaces tabs count for
    termguicolors = true; # True color support
    # TODO
    # timeoutlen = vim.g.vscode and 1000 or 300 # Lower than default (1000) to quickly trigger which-key
    undofile = true;
    undolevels = 10000;
    updatetime = 200; # Save swap file and trigger CursorHold
    virtualedit = "block"; # Allow cursor to move where there is no text in visual block mode
    wildmode = "longest:full,full"; # Command-line completion mode
    winminwidth = 5; # Minimum window width
    wrap = false; # Disable line wrap

    smoothscroll = true;
    foldtext = "";
  };
}
