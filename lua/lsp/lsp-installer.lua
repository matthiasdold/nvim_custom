-- ========== LSP installer ===================================================
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Migrated setup as of: https://github.com/williamboman/nvim-lsp-installer/discussions/636
lsp_installer.setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- ========== LSP config =====================================================


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', 't', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'T', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'f', vim.lsp.buf.formatting, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting_sync, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
-- require('lspconfig')['jedi_language_server'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }
-- require('lspconfig')['sumneko_lua'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }

-- -- ========== Deprecation? =====================================================
-- local my_on_attach = function(client, bufnr)
--     local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--     local opts = { noremap=true, silent=true}
--     buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
--     require("cmp_nvim_lsp").on_attach(client)
-- end
-- 
local lspconfig = require("lspconfig")
-- local opts = {
--     on_attach = require("lsp.handlers").on_attach,
--     capabilities = require("lsp.handlers").capabilities,
-- }
-- local myopts = {
--     on_attach = my_on_attach,
-- }
--
--
-- -- lspconfig.jedi_language_server.setup { opts = opts }
--
-- -- Note: With the new version of nvim-lsp-installer, we are now required
-- --       to call setup on each LSP individually
-- --     --> e.g. for the keymappings definded under the handlers to be available
-- --     for a specific LSP, this really means to initialize like for jedi down below
for _, server in ipairs(lsp_installer.get_installed_servers()) do
    -- custom settings
    if server.name == "jsonls" then
        local jsonls_opts = require("lsp.settings.jsonls")
        lspconfig.jsonls.setup { opts = vim.tbl_deep_extend("force", jsonls_opts, opts)}
    elseif server.name == "sumneko_lua" then
        local sumneko_opts = require("lsp.settings.sumneko_lua")
        lspconfig.sumneko_lua.setup { opts = vim.tbl_deep_extend("force", sumneko_opts, opts)}
    -- servers with default settings
    elseif server.name == "rust_analyzer" then
        require("rust-tools").setup {}
    else
        lspconfig[server.name].setup {
            on_attach = on_attach,
            flags = lsp_flags
        }
    end

end
