local opt = vim.opt
local g = vim.g

local options = require("core.utils").load_config().options

-- Disable Python2 etc providers
g.loaded_python_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

g.python3_host_prog = os.getenv('PYTHON3')

-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
-- Always show in tree view
-- g.netrw_liststyle = 3

-- Open file by default in new tab
g.netrw_browse_split = 3
g.netrw_list_hide= ".*\\.swp$,.*\\.pyc"

-- Keep the current directory and the browsing directory synced. This helps you
-- avoid the move files error. --- I think without this setting, if you try to
-- move file from one directory to another, vim will error. This setting
-- prevents this error - setting always changing pwd, which breaks some plugins
g.netrw_keepdir = 0

g.netrw_winsize = 30
g.netrw_banner = 0
-- Change the copy command. Mostly to enable recursive copy of directories.
g.netrw_localcopydircmd = 'cp -r'

opt.title = true
opt.clipboard = options.clipboard
opt.cmdheight = options.cmdheight
opt.cul = true -- cursor line

-- Indentline
opt.expandtab = options.expandtab
opt.shiftwidth = options.shiftwidth
opt.smartindent = options.smartindent

-- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
opt.fillchars = options.fillchars

opt.hidden = options.hidden
opt.ignorecase = options.ignorecase
opt.smartcase = options.smartcase
opt.mouse = options.mouse

-- Numbers
opt.number = options.number
opt.numberwidth = options.numberwidth
opt.relativenumber = options.relativenumber
opt.ruler = options.ruler

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.tabstop = options.tabstop
opt.termguicolors = true
opt.timeoutlen = options.timeoutlen
opt.undofile = options.undofile

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = options.updatetime

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.mapleader = options.mapleader

-- disable some builtin vim plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   -- "netrw",
   -- "netrwPlugin",
   -- "netrwSettings",
   -- "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
