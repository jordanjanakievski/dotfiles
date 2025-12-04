----------------------------------------------
--- Options
----------------------------------------------
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.g.mapleader = " "
vim.opt.completeopt = { "menuone", "noselect", "popup" }

----------------------------------------------
--- Plugins
----------------------------------------------
require("config.lazy")

----------------------------------------------
--- Theme Persistence
----------------------------------------------
require("config.theme_manager").load()