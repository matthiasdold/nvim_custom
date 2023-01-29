require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
    --[[custom_captures = {
      ["pythonDocstring"] = "TSComment",
    },]]
    -- additional_vim_regex_highlighting = true,   -- get back user specific definitions (python docstrings in my case)
  },
  context_commenting = {
	enable = true,
  },
  matchup = {   -- requires andymass/vim-matchup
    enable = true,
  },
  refactor = {
      highlight_definitions = {
        enable = true
      },
   },
   textobjects = {
     move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      floating_preview_opts = {},
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
}
-- vim.cmd[[set foldmethod=expr]]
-- vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
