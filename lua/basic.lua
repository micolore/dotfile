local opt = vim.opt      
local map = vim.api.nvim_set_keymap

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup({
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
    dotfiles = true,
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
   vim.opt.termguicolors = true
   require("bufferline").setup {
       options = {
           diagnostics = "nvim_lsp",
           offsets = {{
               filetype = "NvimTree",
               text = "File Explorer",
               highlight = "Directory",
               text_align = "left"
           }}
       }
   }
