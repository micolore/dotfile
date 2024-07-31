local opt = vim.opt      
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 39,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)

require'nvim-web-devicons'.setup {
    override = {
     zsh = {
       icon = "",
       color = "#428850",
       cterm_color = "65",
       name = "Zsh"
     }
    };
    color_icons = true;
    default = true;
    strict = true;
    override_by_filename = {
     [".gitignore"] = {
       icon = "",
       color = "#f1502f",
       name = "Gitignore"
     }
    };
    override_by_extension = {
     ["log"] = {
       icon = "",
       color = "#81e043",
       name = "Log"
     }
   };
}

-- buffline manager
vim.opt.termguicolors = true
local bufferline = require('bufferline')
bufferline.setup {
        options = {
            mode = "buffers", 
            numbers =  "ordinal",
	    offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "left", 
                    separator = true
                }
            },
	    diagnostics = "nvim_lsp",
	    color_icons = true,
            max_name_length = 30,
	    show_close_icon = false,
	    modified_icon = '●',
	    left_trunc_marker = '',
            right_trunc_marker = '',
   }
} 

vim.api.nvim_set_keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>bg", ":BufferLinePick", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "bn", ":BufferLineCycleNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "bb", ":BufferLineCyclePrev<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "bd", ":Bdelete<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "bc", ":bufdo :Bdelete<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>bp", ":BufferLinePickClose<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>bo", ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>", {noremap = true, silent = true})

-- outline 
require("outline").setup(
{
  outline_window = {
    position = 'right',
    split_command = nil,
    width = 25, 
    relative_width = true,
    auto_close = false,
    auto_jump = false,
    jump_highlight_duration = 300,
    center_on_jump = true,
    show_numbers = false,
    show_relative_numbers = false,
    wrap = false,
    show_cursorline = true,
    hide_cursor = false,
    focus_on_open = true,
    winhl = '',
  },

  outline_items = {
    show_symbol_details = true,
    show_symbol_lineno = false,
    highlight_hovered_item = true,
    auto_set_cursor = true,
    auto_update_events = {
      follow = { 'CursorMoved' },
      items = { 'InsertLeave', 'WinEnter', 'BufEnter', 'BufWinEnter', 'TabEnter', 'BufWritePost' },
    },
  },

  guides = {
    enabled = true,
    markers = {
      bottom = '└',
      middle = '├',
      vertical = '│',
    },
  },

  symbol_folding = {
    autofold_depth = 1,
    auto_unfold = {
      hovered = true,
      only = true,
    },
    markers = { '', '' },
  },

  preview_window = {
    auto_preview = false,
    open_hover_on_preview = false,
    width = 50,     
    min_width = 50, 
    relative_width = true,
    border = 'single',
    winhl = 'NormalFloat:',
    winblend = 0,
    live = false
  },

  keymaps = { 
    show_help = '?',
    close = {'<Esc>', 'q'},
    goto_location = '<Cr>',
    peek_location = 'o',
    goto_and_close = '<S-Cr>',
    restore_location = '<C-g>',
    hover_symbol = '<C-space>',
    toggle_preview = 'K',
    rename_symbol = 'r',
    code_actions = 'a',
    fold = 'h',
    unfold = 'l',
    fold_toggle = '<Tab>',
    fold_toggle_all = '<S-Tab>',
    fold_all = 'W',
    unfold_all = 'E',
    fold_reset = 'R',
    down_and_jump = '<C-j>',
    up_and_jump = '<C-k>',
  },

  providers = {
    priority = { 'lsp', 'coc', 'markdown', 'norg' },
    lsp = {
      blacklist_clients = {},
    },
    markdown = {
      filetypes = {'markdown',"lsp"},
    },
  },

  symbols = {
    filter = nil,
    icon_fetcher = nil,
    icon_source = nil,
    icons = {
      File = { icon = '󰈔', hl = 'Identifier' },
      Module = { icon = '󰆧', hl = 'Include' },
      Namespace = { icon = '󰅪', hl = 'Include' },
      Package = { icon = '󰏗', hl = 'Include' },
      Class = { icon = '𝓒', hl = 'Type' },
      Method = { icon = 'ƒ', hl = 'Function' },
      Property = { icon = '', hl = 'Identifier' },
      Field = { icon = '󰆨', hl = 'Identifier' },
      Constructor = { icon = '', hl = 'Special' },
      Enum = { icon = 'ℰ', hl = 'Type' },
      Interface = { icon = '󰜰', hl = 'Type' },
      Function = { icon = '', hl = 'Function' },
      Variable = { icon = '', hl = 'Constant' },
      Constant = { icon = '', hl = 'Constant' },
      String = { icon = '𝓐', hl = 'String' },
      Number = { icon = '#', hl = 'Number' },
      Boolean = { icon = '⊨', hl = 'Boolean' },
      Array = { icon = '󰅪', hl = 'Constant' },
      Object = { icon = '⦿', hl = 'Type' },
      Key = { icon = '🔐', hl = 'Type' },
      Null = { icon = 'NULL', hl = 'Type' },
      EnumMember = { icon = '', hl = 'Identifier' },
      Struct = { icon = '𝓢', hl = 'Structure' },
      Event = { icon = '🗲', hl = 'Type' },
      Operator = { icon = '+', hl = 'Identifier' },
      TypeParameter = { icon = '𝙏', hl = 'Identifier' },
      Component = { icon = '󰅴', hl = 'Function' },
      Fragment = { icon = '󰅴', hl = 'Constant' },
      TypeAlias = { icon = ' ', hl = 'Type' },
      Parameter = { icon = ' ', hl = 'Identifier' },
      StaticMethod = { icon = ' ', hl = 'Function' },
      Macro = { icon = ' ', hl = 'Function' },
    },
  },
})
-- normal is error
map("n", "<leader>]", "<cmd>Outline<CR>",default_opts)
map("i", "<C-]>", "<cmd>Outline<CR>",default_opts)

require("toggleterm").setup{
  size = 20,
  open_mapping = [[<c-\>]],
  direction = 'float',
  winbar = {
    enabled = false,
    name_formatter = function(term) 
      return term.name
    end
  },
  float_opts = {
     width  = 150,
     height = 200,
     title_pos = 'center',
     border = 'curved'
  }
}

-- telescope
require'telescope'.setup({
  defaults = {
    mappings = mappings,
    layout_strategy = 'vertical',
    layout_config = {
      height = 80,
      width = 150,
      prompt_position = "bottom",
      prompt_position = "top",
      -- preview_height = 0.6,
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  }
})

-- yank list
require('yankbank').setup({
     max_entries = 9,
     sep = "---",
     num_behavior = "prefix",
     focus_gain_poll = true,
     keymaps = {
            navigation_next = "j",
            navigation_prev = "k",
     },
     registers = {
            yank_register = "+",
     },
})

vim.keymap.set("n", "<leader>y", "<cmd>YankBank<CR>", { noremap = true })

-- harpoon quick change tab 
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,{ desc = "Open harpoon window" })
