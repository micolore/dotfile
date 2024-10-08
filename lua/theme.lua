local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

require('dashboard').setup({
   theme = 'hyper',
   config = {
      project = {
	enable = true,
	limit = 8,
	icon  = "📘",
	action = 'Telescope projects cwd='
      },
      header = {},
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Apps',
          group = 'DiagnosticHint',
          action = 'Telescope projects',
          key = 'a',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope dotfiles',
          key = 'd',
        },
      },
      mru = { 
	   limit = 15 , 
	   cwd_only = false,
	   icon = "🕕"
      },
      footer= {
	 "🎉 No Code, No Bug 🎉"
      }
   },
})

-- colorscheme
require('vscode').load('dark')
--require('github-theme').setup({})

-- local colorscheme = "gruvbox-material"
-- local colorscheme = "catppuccin"
-- local colorscheme = "tokyonight"
-- local colorscheme = "dracula"
--local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- clolorscheme
--if not status_ok then
--  vim.notify("colorscheme " .. colorscheme .. " not found!")
--  return
--end

-- notice you can choice nerd font or default
require("noice").setup({
  cmdline = {
    enabled = true, 
    view = "cmdline_popup", 
    opts = {}, 
    format = {
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
      input = {}, 
    },
  },
  messages = {
    enabled = true, 
    view = "notify", 
    view_error = "notify", 
    view_warn = "notify", 
    view_history = "messages", 
    view_search = "virtualtext", 
  },
  popupmenu = {
    enabled = true, 
    backend = "nui", 
    kind_icons = {}, 
  },
  redirect = {
    view = "popup",
    filter = { event = "msg_show" },
  },
  commands = {
    history = {
      view = "split",
      opts = { enter = true, format = "details" },
      filter = {
        any = {
          { event = "notify" },
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp", kind = "message" },
        },
      },
    },
    last = {
      view = "popup",
      opts = { enter = true, format = "details" },
      filter = {
        any = {
          { event = "notify" },
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp", kind = "message" },
        },
      },
      filter_opts = { count = 1 },
    },
    errors = {
      view = "popup",
      opts = { enter = true, format = "details" },
      filter = { error = true },
      filter_opts = { reverse = true },
    },
  },
  notify = {
    enabled = true,
    view = "notify",
  },
  lsp = {
    progress = {
      enabled = true,
      format = "lsp_progress",
      format_done = "lsp_progress_done",
      throttle = 1000 / 30, 
      view = "mini",
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
      ["vim.lsp.util.stylize_markdown"] = false,
      ["cmp.entry.get_documentation"] = false,
    },
    hover = {
      enabled = true,
      silent = false, 
      view = nil, 
      opts = {}, 
    },
    signature = {
      enabled = true,
      auto_open = {
        enabled = true,
        trigger = true, 
        luasnip = true, 
        throttle = 50, 
      },
      view = nil, 
      opts = {}, 
    },
    message = {
      enabled = true,
      view = "notify",
      opts = {},
    },
    documentation = {
      view = "hover",
      opts = {
        lang = "markdown",
        replace = true,
        render = "plain",
        format = { "{message}" },
        win_options = { concealcursor = "n", conceallevel = 3 },
      },
    },
  },
  markdown = {
    hover = {
      ["|(%S-)|"] = vim.cmd.help, 
      ["%[.-%]%((%S-)%)"] = require("noice.util").open, 
    },
    highlights = {
      ["|%S-|"] = "@text.reference",
      ["@%S+"] = "@parameter",
      ["^%s*(Parameters:)"] = "@text.title",
      ["^%s*(Return:)"] = "@text.title",
      ["^%s*(See also:)"] = "@text.title",
      ["{%S-}"] = "@parameter",
    },
  },
  health = {
    checker = true, 
  },
  smart_move = {
    enabled = true, 
    excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
  },
  presets = {
    bottom_search = false, 
    command_palette = false, 
    long_message_to_split = false, 
    inc_rename = false, 
    lsp_doc_border = false, 
  },
  throttle = 1000 / 30, 
  views = {}, 
  routes = {}, 
  status = {}, 
  format = {}, 
})

-- message notify
require("notify").setup({
    background_colour = "NotifyBackground",
    fps = 20,
    icons = {
      DEBUG = "🐞",
      ERROR = "❌",
      INFO = "✅",
      TRACE = "📒",
      WARN = "❗❗❗"
    },
    level = 2,
    minimum_width = 60,
    render = "default",
    stages = "fade_in_slide_out",
    time_formats = {
      notification = "%T",
      notification_history = "%FT%T"
    },
    timeout = 3000,
    top_down = false 
})

require("colorful-winsep").setup()

local ft = require("cool-chunk.utils.filetype").support_filetypes

require("cool-chunk").setup({
    chunk = {
        notify = true,
        support_filetypes = ft.support_filetypes, 
        exclude_filetypes = ft.exclude_filetypes,
        hl_group = {
            chunk = "CursorLineNr",
            error = "Error",
        },
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            left_arrow = "<",
            bottom_arrow = "v",
            right_arrow = ">",
        },
        textobject = "ah",
        animate_duration = 200, -- if don't want to animation, set to 0.
        fire_event = { "CursorHold", "CursorHoldI" },
    },
    context = {
        notify = true,
        chars = {
            "│",
        },
        hl_group = {
            context = "LineNr",
        },
        exclude_filetypes = ft.exclude_filetypes,
        support_filetypes = ft.support_filetypes,
        textobject = "ih",
        jump_support_filetypes = { "lua", "python" },
        jump_start = "[{",
        jump_end = "]}",
        fire_event = { "CursorHold", "CursorHoldI" },
    },
    line_num = {
        notify = true,
        hl_group = {
            chunk = "CursorLineNr",
            context = "LineNr",
            error = "Error",
        },
        support_filetypes = ft.support_filetypes,
        exclude_filetypes = ft.exclude_filetypes,
        fire_event = { "CursorHold", "CursorHoldI" },
    }
})

--[[ require("zen-mode").toggle({
  window = {
    width = .99 
  },
  plugins = {
    twilight = { enabled = true },  
  }
}) ]]

--[[ require("twilight").setup({
 dimming = {
    alpha = 0.25, 
    color = { "Normal", "#ffffff" },
    term_bg = "#000000", 
    inactive = false, 
  },
  context = 50, 
  treesitter = true, 
  expand = { 
    "function",
    "method",
    "table",
    "if_statement",
  },
  exclude = {}, 
}) ]]


