local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
		width = 60,
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		width = 60,
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
	-- end
end

local function lsp_keymaps(bufnr)
    local function nbmap(k, v)
        vim.api.nvim_buf_set_keymap(bufnr, "n", k, v, { noremap = true, silent = true })
    end

	nbmap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	nbmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	nbmap("M", "<cmd>lua vim.lsp.buf.hover()<CR>")
	nbmap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	nbmap("<C-m>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	-- nbmap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
	nbmap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	-- nbmap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	-- nbmap("<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>")
	nbmap("[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>')
	nbmap( "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>')
	nbmap("]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>')
	nbmap("<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
end

M.on_attach = function(client, bufnr)
	-- vim.notify(client.name .. " starting...")
	-- TODO: refactor this into a method that checks if string in list
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M

