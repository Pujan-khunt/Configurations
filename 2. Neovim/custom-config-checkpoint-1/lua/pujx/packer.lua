return require("packer").startup(function(use)
  -- Packer Will Manage Itself
  use ({"wbthomason/packer.nvim"});

  -- Telescope - Fuzzy Search
  use ({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    requires = { {"nvim-lua/plenary.nvim"} }
  });

  -- Github Dark Theme For Neovim
  use({
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme')
    end
  });

  -- TreeSitter
  use({
    "nvim-treesitter/nvim-treesitter",
    { run = ":TSUpdate" }
  });

  -- Harpoon
  use({
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } }
  });

  -- UndoTree
  use({
    "mbbill/undotree"
  });

  -- Neovim Lua Type Definitions
  use({
    "folke/neodev.nvim",
    config = function ()
      require("neodev").setup({})
    end
  })

  -- Vim Fugitive - Git Service
  use({
    "tpope/vim-fugitive"
  });

  -- Neovim LSP Config
  use({'neovim/nvim-lspconfig'})

  -- Autocompletion
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})

  -- Mason Installer
  use({"williamboman/mason.nvim", run = ":MasonUpdate"})
  use({"williamboman/mason-lspconfig.nvim"})

  -- Snippet Engine (Not Yet Configured)
  use({"L3MON4D3/LuaSnip"})

  use({"folke/neodev.nvim"})

end)
