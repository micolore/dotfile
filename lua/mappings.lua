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

-- 输入模式下删除一个单词
map('i','<C-d>','<C-o>dw',default_opts)

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

-- Move word、line
map('i','<C-e>','<END>',{ noremap = true})
map('i','<C-a>','<HOME>',{ noremap = true})

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

local pluginKeys = {}

pluginKeys.maplsp = function(mapbuf)

end

return pluginKeys