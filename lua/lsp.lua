local capabilities = require("cmp_nvim_lsp").default_capabilities() -- nvim LSP client's capabilities

-- set up LSP client
local lspconfig = require("lspconfig")

-- vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]) -- format on save with active (registered) LSP

lspconfig.gopls.setup({
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 }) -- "map (pls) 'K' in normal mode to function vim.lsp.buf.hover, only in the normal buffer"
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
		vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, { buffer = 0 })
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
		vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = 0 })
		vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
		vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
		vim.keymap.set("n", "<leader>c", vim.lsp.buf.rename, { buffer = 0 })
		vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = 0 })
	end,
	capabilities = capabilities,
})

lspconfig.clangd.setup({
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 }) -- "map (pls) 'K' in normal mode to function vim.lsp.buf.hover, only in the normal buffer"
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
		vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, { buffer = 0 })
		vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = 0 })
		vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
		vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
		vim.keymap.set("n", "<leader>c", vim.lsp.buf.rename, { buffer = 0 })
		vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = 0 })
	end,
})

lspconfig.pyright.setup({
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 }) -- "map (pls) 'K' in normal mode to function vim.lsp.buf.hover, only in the normal buffer"
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
		vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, { buffer = 0 })
		vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = 0 })
		vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
		vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
		vim.keymap.set("n", "<leader>c", vim.lsp.buf.rename, { buffer = 0 })
		vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = 0 })
	end,
	capabilities = capabilities,
})

lspconfig.ts_ls.setup({})
lspconfig.zls.setup({
	settings = {
		zls = {
			enable_autofix = false,
		},
	},
})

--lspconfig.svls.setup({})
lspconfig.rust_analyzer.setup({})

-- Set up nvim-cmp.
vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})
