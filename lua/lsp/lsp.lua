local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- open lsp debug log
-- vim.lsp.set_log_level("debug")

-- Mason Setup
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    },
    registries = {
       "github:nvim-java/mason-registry",
       "github:mason-org/mason-registry",
    },
})

require("mason-lspconfig").setup()

--- lsp start
local _lspconfig, lspconfig = pcall(require, "lspconfig")

lspconfig.bashls.setup({
  autostart = false,
})
--- lsp end 

require("project_nvim").setup {
  manual_mode = false,
  detection_methods = { "lsp", "pattern" },	
  patterns = { ".git","package.json","Cargo.toml" }  
}

require('telescope').load_extension('projects')

local cmp = require("cmp")
cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

 sources = {
    { name = 'path' },                              -- file paths
    { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
    { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
    { name = 'calc'},                               -- source for math calculation
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})

local keymap_opts = { buffer = buffer }
vim.opt.updatetime = 100

local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
   vim.diagnostic.open_float(nil, { focusable = false })
  end,
  group = diag_float_grp,
})

-- Goto previous/next diagnostic warning/error
vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, keymap_opts)
vim.keymap.set("n", "g]", vim.diagnostic.goto_next, keymap_opts)

-- Treesitter Plugin Setup 
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "rust", "toml" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true }, 
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

local action = require 'telescope.actions'
local mappings = {
  i = { 
    ["<C-Down>"] = action.cycle_history_next,
    ["<C-Up>"] = action.cycle_history_prev,
  },
  n = {
    ["t"] = action.toggle_all, 
    ["T"] = action.drop_all, 
    ["d"] = action.delete_buffer,
    ["a"] = action.add_selected_to_qflist,
    ["A"] = action.add_to_qflist,
  }
}

require("telescope").load_extension("ui-select")
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'gb', builtin.lsp_references, {})
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
vim.keymap.set('n', 'ji', builtin.lsp_incoming_calls, {})
vim.keymap.set('n', 'jo', builtin.lsp_outgoing_calls, {})
vim.keymap.set('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', {})
vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', {})
vim.api.nvim_set_keymap('n', '<C-m>', ':lua vim.lsp.buf.format({ async = true }); vim.cmd("write")<CR>', default_opts)

require('lualine').setup({
    options = {
        theme = 'vscode',
    },
})

require("nvim-autopairs").setup()

require("nvim-lastplace").setup({
   lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
   lastplace_ignore_filetype = {
           "gitcommit",
           "gitrebase",
           "svn",
           "hgcommit",
        },
   lastplace_open_folds = true,
})

require('mini.indentscope').setup({
  draw = {
    delay = 100,
    priority = 2,
  },
  mappings = {
    object_scope = 'ii',
    object_scope_with_border = 'ai',

    goto_top = '[i',
    goto_bottom = ']i',
  },

  options = {
    border = 'both',
    indent_at_cursor = true,
    try_as_border = false,
  },
  symbol = '╎',
})

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

vim.cmd([[
  set signcolumn=yes
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

require('Comment').setup()

