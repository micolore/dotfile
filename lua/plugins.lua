local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Autocommand to reload plugins.lua on save
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- Dependencies
  use "wbthomason/packer.nvim"                        -- Packer manage itself
  use "nvim-lua/popup.nvim"                           -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"                         -- Useful lua functions used by lots of plugins
  use 'kyazdani42/nvim-web-devicons'                  -- Adds file type icons to Vim plugins

  -- General
  use "windwp/nvim-autopairs"                         -- Autopairs, integrates with both cmp and treesitter
  use "akinsho/bufferline.nvim"                       -- Snazzy bufferline
  use "moll/vim-bbye"                                 -- Bclose.vim but rewritten and well maintained.
  use "karb94/neoscroll.nvim"

  -- use 'nacro90/numb.nvim'                             -- Easy peek lines
  use 'mg979/vim-visual-multi'                        -- Multiple cursors
  use 'nvim-lualine/lualine.nvim'                     -- Easy to configure neovim statusline
  use "akinsho/toggleterm.nvim"                       -- Easily manage multiple terminal windows
  use 'lewis6991/impatient.nvim'                      -- Improve startup time
  use "lukas-reineke/indent-blankline.nvim"           -- Indent guides
  use "echasnovski/mini.nvim"

  -- Startify
  use 'goolord/alpha-nvim'                            -- Greeter like startify
  use "antoinemadec/FixCursorHold.nvim"               -- Fix lsp doc highlight

  -- Colorscheme
  use 'sainnhe/gruvbox-material'                      -- Gruvbox with Material Palette

  -- Auto-completion
  use "hrsh7th/nvim-cmp"                              -- Completion (cmp) plugin
  use "hrsh7th/cmp-buffer"                            -- Cmp source for buffer words
  use "hrsh7th/cmp-path"                              -- Cmp source for path
  use "hrsh7th/cmp-nvim-lsp"                          -- Cmp source for LSP client
  use "hrsh7th/cmp-nvim-lua"                          -- Cmp source for nvim lua
  use "hrsh7th/cmp-cmdline"                           -- Cmp source for vim's cmdline

  -- Snippets
  use "L3MON4D3/LuaSnip"                              -- Snippet engine
  use "rafamadriz/friendly-snippets"                  -- Preconfigured snippets
  use "hrsh7th/cmp-vsnip"
  use "saadparwaiz1/cmp_luasnip"                      -- Luasnip completon source

  -- LSP
  use "neovim/nvim-lspconfig"                         -- Enable native LSP
  use "williamboman/nvim-lsp-installer"               -- Language server installer
  use "jose-elias-alvarez/null-ls.nvim"               -- Inject LSP diagnostics, code actions ...
  use("simrat39/rust-tools.nvim")
  use 'williamboman/mason.nvim'    
  use 'williamboman/mason-lspconfig.nvim'
  use 'folke/todo-comments.nvim'
  use 'folke/trouble.nvim'
  use "tpope/vim-surround"
  use "RRethy/vim-illuminate"
  use 'nvim-zh/colorful-winsep.nvim'

  use 'hedyhli/outline.nvim'

  -- comment
  use "numToStr/Comment.nvim"
  use "b3nj5m1n/kommentary"                           -- Commenting plugin
  
  --use "preservim/tagbar"
  use "liuchengxu/vista.vim"
  
  -- Fzf
  use 'kyazdani42/nvim-tree.lua'                      -- File explorer tree
  use "nvim-telescope/telescope.nvim"                 -- Find, Filter, Preview, Pick. All lua, all the time.
  use "ahmedkhalf/project.nvim"                       -- Project manager
  use "nvim-telescope/telescope-ui-select.nvim"

  -- Treesitter
  use "nvim-treesitter/nvim-treesitter"               -- Treesitter configuration
  -- use "puremourning/vimspector" -- debug
  -- use 'CRAG666/code_runner.nvim'

  -- notice 
  use "folke/noice.nvim"
  use "MunifTanjim/nui.nvim"
  use "rcarriga/nvim-notify"

  -- search
  use "arcticicestudio/nord-vim"
  use "ethanholz/nvim-lastplace"
  use "ggandor/leap.nvim"
  use "ggandor/flit.nvim"
  use "phaazon/hop.nvim"

  -- git
  use "NeogitOrg/neogit"
  --use "kdheepak/lazygit.nvim"
  use "lewis6991/gitsigns.nvim"                       -- Git integration
  use "sindrets/diffview.nvim" 

  use "folke/which-key.nvim"
  use "nvim-pack/nvim-spectre" --搜索替换
  use "ashfinal/qfview.nvim"

  use "catppuccin/nvim" -- neovim theme
  use "folke/tokyonight.nvim"
  use "projekt0n/github-nvim-theme"
  use "Mofiqul/dracula.nvim"

  -- use "romgrk/barbar.nvim" -- tab line

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
