local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		-- formatting.black.with({ extra_args = { "--fast" } }),
		formatting.autopep8,
		formatting.stylua,
        diagnostics.flake8
	},
	-- for formatting on save
	on_attach = function(client, bufnr)
    	    if client.supports_method("textDocument/formatting") then
    	        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    	        vim.api.nvim_create_autocmd("BufWritePre", {
    	            group = augroup,
    	            buffer = bufnr,
    	            callback = function()
    	                vim.lsp.buf.format({ bufnr = bufnr })
    	                -- vim.lsp.buf.formatting_sync()
    	            end,
    	        })
    	    end
    	end
})
