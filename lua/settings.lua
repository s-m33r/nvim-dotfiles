local set = vim.opt
local g = vim.g

-- EDITOR SETTINGS
set.compatible = false -- disable vi compatibility
set.hlsearch = true -- highlight search

set.number = true -- add line numbers
set.relativenumber = true -- relative line numbers

set.mouse = "a" -- enable mousel click
set.cursorline = true -- highlight line
--set.showmode = false -- don't display mode because that's already handled by statusline plugin

set.colorcolumn = "90" -- colorcolumn as reminder not to have insanely long lines

set.tabstop = 4 -- columns occupied by a Tab
set.softtabstop = 4 -- see multiple spaces as tabstops
set.shiftwidth = 4 -- width for autoindents
set.autoindent = true

set.background = "dark" -- set dark background for themes
set.termguicolors = true -- true color support

set.hidden = true
set.encoding = "utf-8"

-- syntax
set.syntax = "on"

