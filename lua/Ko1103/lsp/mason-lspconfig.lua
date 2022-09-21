require("mason-lspconfig").setup({
	ensure_installed = {
		-- lua
		"sumneko_lua",
		"stylua", -- manually install

		-- javascript and typescirpt
		"tsserver",
		"eslint_d", -- manually install
		"prettiered", -- manually install
		"denols",

		-- rust
		"rust_analyzer",
		"rome",

		"gopls",

		-- terraform
		-- make sure you have go and terraform
		-- For Mac, brew install go, terraform
		"terraformls",
		"tflint",
	},
	automatic_installation = true,
})

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
	-- 	vim.cmd([[
	-- set updatetime=500
	-- highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
	-- highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
	-- highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
	-- augroup lsp_document_highlight
	--   autocmd!
	--   autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
	--   autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
	-- augroup END
	-- ]])
end

-- autosave
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.formatting_sync()
	-- 0.8 or higher
	-- vim.lsp.buf.format({
	--     filter = function(client)
	--         -- apply whatever logic you want (in this example, we'll only use null-ls)
	--         return client.name == "null-ls"
	--     end,
	--     bufnr = bufnr,
	-- })
end

local function lsp_autosave(client, bufnr)
	-- if client.supports_method("textDocument/formatting") then
	-- 	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	-- 	vim.api.nvim_create_autocmd("BufWritePre", {
	-- 		group = augroup,
	-- 		buffer = bufnr,
	-- 		callback = function()
	-- 			-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
	-- 			vim.lsp.buf.formatting_sync()
	-- 		end,
	-- 	})
	-- end
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

local on_attach = function(client, bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)

	-- LSP Handlers
	vim.lsp.handlers["textDocument/publishDiagnostics"] =
		vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })

	lsp_highlight_document(client)
	lsp_autosave(client, bufnr)
	client.resolved_capabilities.document_formatting = false
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason-lspconfig").setup_handlers({
	function(server)
		local ops = {
			on_attach = on_attach,
			lsp_flags = lsp_flags,
			capabilities = capabilities,
		}
		if server == "sumneko_lua" then
			ops.settings = {
				Lua = {
					-- formatting = true,
					format = {
						enable = false,
					},
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			}
		end
		local nvim_lsp = require('lspconfig')
		if server == "denols" then
			ops.root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc")
		end
		if server == "tsserver" then
			ops.root_dir = nvim_lsp.util.root_pattern("package.json")
		end
		require("lspconfig")[server].setup(ops)
	end,
})
