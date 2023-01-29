return function(use)
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  })
  --  use({'lukas-reineke/indent-blankline.nvim'})
  --
  use({ "kyazdani42/nvim-web-devicons" })

  -- tab bars
  use({ "romgrk/barbar.nvim" })
  --
  -- nerd tree but nicer
  use({ "kyazdani42/nvim-tree.lua" })

  use({ "bluz71/vim-moonfly-colors" })

  -- Preview Colors
  -- use 'norcalli/nvim-colorizer.lua' --> might slow telescope, see https://github.com/nvim-telescope/telescope.nvim/issues/2008
  -- --> Alternative? Not lua but claims to be very fast
  use({
    "RRethy/vim-hexokinase",
    run = "cd ~/.local/share/nvim/site/pack/packer/start/vim-hexokinase && make hexokinase",
  })

  -- LSP for rust
  use({ "simrat39/rust-tools.nvim" })

  use({ "hrsh7th/cmp-nvim-lsp" })
  -- use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use({ "hrsh7th/cmp-buffer" }) -- buffer completions
  use({ "hrsh7th/cmp-path" }) -- path completions
  use({ "hrsh7th/cmp-cmdline" }) -- cmdline completions
  use({ "L3MON4D3/LuaSnip" })
  use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions in cmp
  use({ "hrsh7th/vim-vsnip-integ" }) -- to integrate with the lsp client
  use({ "rafamadriz/friendly-snippets" }) -- predefined snippets

  -- Auto Docstring generation
  use({
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  })

  use({ "ray-x/lsp_signature.nvim" })

  -- General various
  use({ "windwp/nvim-autopairs" })

  -- REPL
  use({ "hkupty/iron.nvim" })

  --  -- startify
  use({ "mhinz/vim-startify" })
  --
  --  -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    run = "cd app && yarn install",
  })
  --  -- use 'iamcco/markdown-preview.nvim'
  --  -- use { 'ixru/nvim-markdown' }
  -- use { 'ellisonleao/glow.nvim' }     -- Note the additional manual steps noted on the git page
  --
  --  -- Nicer python indentation
  --  use({'Vimjas/vim-python-pep8-indent'})
  --
  --  -- Multi coursor: https://github.com/mg979/vim-visual-multi/wiki/Quick-start
  use({ "mg979/vim-visual-multi" })
  --
  --  -- Improved folding for python
  use({ "tmhedberg/SimpylFold" })
  --
  -- Others
  use({
    "lewis6991/spellsitter.nvim",
  })
  use({
    "notjedi/nvim-rooter.lua",
  })
  --
  --  -- Latex
  use({ "lervag/vimtex" })
  --
  --  -- Shader editing
  use({ "tikhomirov/vim-glsl" })
  --
  --  -- Better moving around
  use({ "ggandor/leap.nvim" })

  use({ "jose-elias-alvarez/null-ls.nvim" })

  -- ====================== loading modules ===================================
  --  -- Installing my custom modules
  --  require('custom_plugins')
  require("colorscheme")
  --
  require("c_cmp")
  --
  require("c_lualine")
  require("c_treesitter")
  require("c_hexokinase")
  require("barbar")
  require("autopairs")
  require("c_iron")
  require("c_startify")
  require("c_nvimtree")
  require("c_comment")
  require("c_lsp_signature")
  --
  --  -- Moving around
  require("leap").add_default_mappings()
  --
  --  -- Others
  require("c_rooter") -- change root on file open -- not yet a good config
  require("luasnip.loaders.from_vscode").lazy_load()
  require("c_neogen")
  --  -- Others
  require("spellsitter").setup()
  vim.cmd("source $HOME/.config/nvim/vim/vim_configs.vim")

  require("c_null_ls")
end
