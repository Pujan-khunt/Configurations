-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Setup Mason Default Configs
require('mason').setup({})
require('mason-lspconfig').setup({})

-- Setup Lua LSP Config Separately
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      telemetry = {
        enable = false
      },
    },
  },
  on_init = function(client)
    local nvim_settings = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' }
      },
      workspace = {
        checkThirdParty = false,
        library = {
          -- Make the server aware of Neovim runtime files
          vim.env.VIMRUNTIME,
          vim.fn.stdpath('config'),
          vim.fn.stdpath("config") .. "/lua",
        },
      },
    }

    client.config.settings.Lua = vim.tbl_deep_extend(
      'force',
      client.config.settings.Lua,
      nvim_settings
    )
  end,
})

-- Cmp Setup
local cmp = require('cmp')

cmp.setup({
  sources = cmp.config.sources({
    { name = "nvim_lsp" }
  }, {
    { name = "buffer" }
  }),
  -- Snippet Engine
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({

    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-a>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

    -- Use `j` and `k` in insert mode to navigate suggestions
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }
})

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf, remap = false }

    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', '<leader>cr', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set({ 'n', 'x' }, "<C-f>", function() vim.lsp.buf.format({ async = true }) end, opts)
    vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>cl", function() vim.diagnostic.open_float() end, opts)
  end,
})

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)
