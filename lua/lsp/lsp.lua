local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Setup language servers.
local _lspconfig, lspconfig = pcall(require, "lspconfig")

-- Bash
lspconfig.bashls.setup({
  autostart = false,
})

require("project_nvim").setup {
  manual_mode = false,
  detection_methods = { "lsp", "pattern" },	
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" ,"=src" }  
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
-- use telescope config
-- vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, keymap_opts)
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymap_opts)
-- vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
-- vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, keymap_opts)
-- vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
-- vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)

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

-- Mason Setup
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup()

-- rust

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
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
require'telescope'.setup({
  defaults = {
    mappings = mappings,
    layout_strategy = 'vertical',
    layout_config = {
      height = 100,
      width = 200,
      prompt_position = "bottom",
      prompt_position = "top",
      preview_height = 0.6,
    },
  },
  pickers = {
  }
})

require("telescope").load_extension("ui-select")
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>gb', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>ji', builtin.lsp_incoming_calls, {})
vim.keymap.set('n', '<leader>jo', builtin.lsp_outgoing_calls, {})

require("null-ls").setup()

require'Comment'.setup {
    padding = true,
    ignore = nil,
    toggler = {
        line = 'gcc',
        block = 'gbc',
    },
    opleader = {
        line = 'gc',
        block = 'gb',
    },
    extra = {
        above = 'gcO',
        below = 'gco',
        eol = 'gcA',
    },
}

require("nvim-autopairs").setup()

require('lualine').setup({

})

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

require("colorful-winsep").setup()

-- dashboard
-- require'alpha'.setup(require'alpha.themes.dashboard'.config)

-- Git

require("neogit").setup()

require("diffview").setup()

require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  }
}

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

