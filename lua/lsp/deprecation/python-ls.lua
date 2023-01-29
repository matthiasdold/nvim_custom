-- npm i -g pyright
-- O is defined in globals.lua

--require'lspconfig'.pyright.setup{
require'lspconfig'.pyls.setup{
    -- jedi does not provide linting --> try to setup separately is this config
    -- require'lspconfig'.jedi_language_server.setup{
    -- NOTE: Pyright does not work properly --> pyls seems much better, although not being the default with
    -- nvim lspinstall. Since "pyls" is a python program (not an executeable) we do not specify a cmd
    -- cmd = {DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
    on_attach = require'lsp'.lspconfig_on_attach,
    -- on_attach = require('completion').on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = O.python.diagnostics.virtual_text,
            signs = O.python.diagnostics.signs,
            underline = O.python.diagnostics.underline,
            update_in_insert = true

        }),
        ['client/registerCapability'] = function(_, _, z, j)
        -- print(vim.inspect(y), vim.inspect(z), vim.inspect(j))
            return {
              result = nil,
              error = nil
            }
        end
    },
    filetypes = {"python"},
    root_dir = require('lspconfig').util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt");
    settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true;
            };
          };
    };
  docs = {
    description = [[
        https://github.com/microsoft/pyright

        `pyright`, a static type checker and language server for python
        ]];
    }
}
