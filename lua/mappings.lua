-- mappings.lua
local opt = vim.opt             -- global/buffer/windows-scoped options
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

local g = vim.g         	  -- global variables
g.mapleader = ' '             -- change leader to a comma

opt.cursorcolumn = true
opt.cursorline =true

opt.number = true             -- show line number
opt.relativenumber = true

map("n", "<Leader>u", ":PackerSync<CR>",default_opts)

-- quick new  file
map("n", "<Leader>n", "<cmd>enew<CR>",default_opts)
-- select all of file
map("n", "<Leader>aa", "ggVG<c-$>",default_opts)
-- visual model copy line
map("v", "y", "ygv<Esc>",default_opts)
-- mormal model copy to end  of line
map("n", "Y", "y$",default_opts)

-- map Esc to kk
map('i', 'kk', '<Esc>', {noremap = true})

-- fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>', default_opts)

-- Save
map('n','<leader>s','<esc>:w<CR>',{ noremap = true})

-- Quit
map('n','<leader>q',':q<CR>',{ noremap = true})

-- Window Move
map('n','<leader>h','<C-W>h',{ noremap = true})
map('n','<leader>l','<C-W>l',{ noremap = true})
map('n','<leader>k','<C-W>k',{ noremap = true})
map('n','<leader>j','<C-W>j',{ noremap = true})

-- Buffer Move
map('n','bu',':enew<CR>',{ noremap = true})
map('n','bn',':bnext<CR>',{ noremap = true})
map('n','bb',':bprevious<CR>',{ noremap = true})
map('n','bd',':bdelete<CR>',{ noremap = true})

-- Move word、line like emacs
map('i','<C-e>','<END>',{ noremap = true})
map('i','<C-a>','<HOME>',{ noremap = true})
map('i','<C-b>','<C-o>b',default_opts)
map('i','<C-w>','<C-o>w',default_opts)
-- 输入模式下删除一个单词
map('i','<C-d>','<C-o>dw',default_opts)

-- file exploree
map('n','<leader>r',':NvimTreeToggle<CR>',{noremap = true})

-- window
vim.api.nvim_set_keymap('n', '<leader>wh', ':FocusSplitLeft<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>wd', ':FocusSplitDown<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>wu', ':FocusSplitUp<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>wl', ':FocusSplitRight<CR>', { silent = true })

-- Telescope
vim.api.nvim_set_keymap('n', 'ff',"<cmd>lua require('telescope.builtin').find_files() prompt_prefix=🔍<CR>",{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'fg',"<cmd>lua require('telescope.builtin').live_grep()<CR>",{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'fb',"<cmd>lua require('telescope.builtin').buffers()<CR>",{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'fl',"<cmd>lua require('telescope.builtin').oldfiles()<CR>",{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'fh',"<cmd>lua require('telescope.builtin').help_tags()<CR>",{ noremap = true, silent = true })

-- 离开输入模式，自动切换成英文模式(silent 静默模式)
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = { "*" },
    command = "silent !C:\\moppo\\workspace\\tools\\im-select.exe 1033",
    nested = true,
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
--vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
--vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
--vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>d', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- scoll
-- require('neoscroll').setup({
--   mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
--                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
--    hide_cursor = true,          -- Hide cursor while scrolling
--    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
--    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
--    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
--    easing_function = nil,       -- Default easing function
--    pre_hook = nil,              -- Function to run before the scrolling animation starts
--    post_hook = nil,             -- Function to run after the scrolling animation ends
--    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
--})

 require("which-key").setup(
 {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  motions = {
    count = true,
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
    padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    zindex = 1000, -- positive value to position WhichKey above other floating windows.
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specifiy a list manually
  -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
  triggers_nowait = {
    -- marks
    "`",
    "'",
    "g`",
    "g'",
    -- registers
    '"',
    "<c-r>",
    -- spelling
    "z=",
  },
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for keymaps that start with a native binding
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by default for Telescope
  disable = {
    buftypes = {},
    filetypes = {},
  },
})

-- sed use windows
require('spectre').setup({
  color_devicons = true,
  open_cmd = 'vnew',
  live_update = false, -- auto execute search again when you write to any file in vim
  lnum_for_results = true, -- show line number for search/replace results
  line_sep_start = '┌-----------------------------------------',
  result_padding = '¦  ',
  line_sep       = '└-----------------------------------------',
  highlight = {
      ui = "String",
      search = "DiffChange",
      replace = "DiffDelete"
  },
  mapping={
    ['tab'] = {
        map = '<Tab>',
        cmd = "<cmd>lua require('spectre').tab()<cr>",
        desc = 'next query'
    },
    ['shift-tab'] = {
        map = '<S-Tab>',
        cmd = "<cmd>lua require('spectre').tab_shift()<cr>",
        desc = 'previous query'
    },
    ['toggle_line'] = {
        map = "dd",
        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
        desc = "toggle item"
    },
    ['enter_file'] = {
        map = "<cr>",
        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
        desc = "open file"
    },
    ['send_to_qf'] = {
        map = "<leader>q",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        desc = "send all items to quickfix"
    },
    ['replace_cmd'] = {
        map = "<leader>c",
        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
        desc = "input replace command"
    },
    ['show_option_menu'] = {
        map = "<leader>o",
        cmd = "<cmd>lua require('spectre').show_options()<CR>",
        desc = "show options"
    },
    ['run_current_replace'] = {
      map = "<leader>rc",
      cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
      desc = "replace current line"
    },
    ['run_replace'] = {
        map = "<leader>R",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "replace all"
    },
    ['change_view_mode'] = {
        map = "<leader>v",
        cmd = "<cmd>lua require('spectre').change_view()<CR>",
        desc = "change result view mode"
    },
    ['change_replace_sed'] = {
      map = "trs",
      cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
      desc = "use sed to replace"
    },
    ['change_replace_oxi'] = {
      map = "tro",
      cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
      desc = "use oxi to replace"
    },
    ['toggle_live_update']={
      map = "tu",
      cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
      desc = "update when vim writes to file"
    },
    ['toggle_ignore_case'] = {
      map = "ti",
      cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
      desc = "toggle ignore case"
    },
    ['toggle_ignore_hidden'] = {
      map = "th",
      cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
      desc = "toggle search hidden"
    },
    ['resume_last_search'] = {
      map = "<leader>l",
      cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
      desc = "repeat last search"
    },
    -- you can put your mapping here it only use normal mode
  },
  find_engine = {
    -- rg is map with finder_cmd
    ['rg'] = {
      cmd = "rg",
      -- default args
      args = {
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
      } ,
      options = {
        ['ignore-case'] = {
          value= "--ignore-case",
          icon="[I]",
          desc="ignore case"
        },
        ['hidden'] = {
          value="--hidden",
          desc="hidden file",
          icon="[H]"
        },
        -- you can put any rg search option you want here it can toggle with
        -- show_option function
      }
    },
    ['ag'] = {
      cmd = "ag",
      args = {
        '--vimgrep',
        '-s'
      } ,
      options = {
        ['ignore-case'] = {
          value= "-i",
          icon="[I]",
          desc="ignore case"
        },
        ['hidden'] = {
          value="--hidden",
          desc="hidden file",
          icon="[H]"
        },
      },
    },
  },
  replace_engine={
      ['sed']={
          cmd = "sed",
          args = nil,
          options = {
            ['ignore-case'] = {
              value= "--ignore-case",
              icon="[I]",
              desc="ignore case"
            },
          }
      },
      -- call rust code by nvim-oxi to replace
      ['oxi'] = {
        cmd = 'oxi',
        args = {},
        options = {
          ['ignore-case'] = {
            value = "i",
            icon = "[I]",
            desc = "ignore case"
          },
        }
      }
  },
  default = {
      find = {
          --pick one of item in find_engine
          cmd = "rg",
          options = {"ignore-case"}
      },
      replace={
          --pick one of item in replace_engine
          cmd = "sed"
      }
  },
  replace_vim_cmd = "cdo",
  is_open_target_win = true, --open file on opener window
  is_insert_mode = false,  -- start open panel on is_insert_mode
  is_block_ui_break = false -- mapping backspace and enter key to avoid ui break
})

vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

local pluginKeys = {}

pluginKeys.maplsp = function(mapbuf)

end

return pluginKeys
