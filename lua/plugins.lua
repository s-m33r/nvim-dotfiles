local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

plugins = {
	"tpope/vim-fugitive", -- better git stuff
	"tpope/vim-rhubarb",
	"sindrets/diffview.nvim",

	"nvim-tree/nvim-web-devicons", -- icons are good

	"tpope/vim-sleuth", -- detect tabstop and shiftwidth automatically

	-- # Telescope - fuzzy finding and shit
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"dyng/ctrlsf.vim",
	-- ##

	-- # better experience
	"ap/vim-css-color", -- show colors for corresponding hex codes
	"rstacruz/vim-closer", -- close parens
	"alvan/vim-closetag", -- auto close HTML tags
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	"mangelozzi/rgflow.nvim",
	-- ##

	"voldikss/vim-floaterm", -- floating terminal window
	{ "folke/which-key.nvim", opts = {} }, -- key-"chord" (?) suggestions

	-- # themes
	{ "pineapplegiant/spaceduck", lazy = true },
	{ "ayu-theme/ayu-vim", lazy = true },
	{ "nanotech/jellybeans.vim", lazy = true },
	{
		"morhetz/gruvbox",
		lazy = true,
		init = function()
			vim.g.gruvbox_contrast_dark = "hard"
		end,
	},
	{ "embark-theme/vim", lazy = true },
	{ "jaredgorski/SpaceCamp", lazy = true },
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			vim.cmd([[colorscheme tokyodark]])
		end,
	},
	{ "Mofiqul/vscode.nvim" },
	-- ##

	-- # vimwiki
	{
		"vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_list = {
				{
					path = "~/vimwiki/",
					syntax = "markdown",
					ext = ".md",
				},
			}
		end,
	},
	-- ##

	-- # lsp related
	"neovim/nvim-lspconfig",

	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",

	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",

	{
		"stevearc/conform.nvim",
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
	},

	{
		"David-Kunz/gen.nvim",
		opts = {
			model = "deepseek-coder", -- The default model to use.
			host = "localhost", -- The host running the Ollama service.
			port = "1114", -- The port on which the Ollama service is listening.
			quit_map = "q", -- set keymap for close the response window
			retry_map = "<c-r>", -- set keymap to re-send the current prompt
			init = function(options)
				pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
			end,
			-- Function to initialize Ollama
			command = function(options)
				local body = { model = options.model, stream = true }
				return "curl --silent --no-buffer -X POST http://"
					.. options.host
					.. ":"
					.. options.port
					.. "/api/generate -d $body"
			end,
			-- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
			-- This can also be a command string.
			-- The executed command must return a JSON object with { response, context }
			-- (context property is optional).
			-- list_models = '<omitted lua function>', -- Retrieves a list of model names
			display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split".
			show_prompt = false, -- Shows the prompt submitted to Ollama.
			show_model = false, -- Displays which model you are using at the beginning of your chat session.
			no_auto_close = false, -- Never closes the window automatically.
			debug = false, -- Prints errors and the command which is run.
		},
	},
	-- ##

	-- # syntax
	"Tetralux/odin.vim",
	"stefanos82/nelua.vim",
	-- ##

	"tybenz/vimdeck",
}

require("lazy").setup(plugins, opts)

-- ripgrep plugin setup
require("rgflow").setup({
	-- Set the default rip grep flags and options for when running a search via
	-- RgFlow. Once changed via the UI, the previous search flags are used for
	-- each subsequent search (until Neovim restarts).
	cmd_flags = "--smart-case --fixed-strings --ignore --max-columns 200",

	-- Mappings to trigger RgFlow functions
	default_trigger_mappings = true,
	-- These mappings are only active when the RgFlow UI (panel) is open
	default_ui_mappings = true,
	-- QuickFix window only mapping
	default_quickfix_mappings = true,
})
