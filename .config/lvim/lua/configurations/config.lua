lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "lunar"

vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.spell = false
vim.opt.spelllang = "en"

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.completeopt = "menuone,noselect"


vim.g.nord_italic = false
require('nord').set()

lvim.colorscheme = 'nord'
-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"
--

-- Default
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Others Projects
-- vim.opt.tabstop = 2
-- vim.opt.softtabstop = 2
-- vim.opt.shiftwidth = 2
-- lvim.format_on_save = false
