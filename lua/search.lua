-- leap is good. but it's not match me.
require("leap").opts.highlight_unlabeled_phase_one_targets = true
vim.keymap.set({ "x", "o", "n" }, "r", "<Plug>(leap-forward-to)")
vim.keymap.set({ "x", "o", "n" }, "R", "<Plug>(leap-backward-to)")
vim.keymap.set({ "x", "o", "n" }, "W", "<Plug>(leap-from-window)")

require("flit").setup({
      keys = { f = "f", F = "F", t = "t", T = "T", },
      labeled_modes = "v",
      multiline = true,
      opts = {},
}) 

require("hop").setup({})
   -- vim.api.nvim_set_keymap("n", "R", "<cmd>HopChar2<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "E", "<cmd>HopChar1<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "ww", "<cmd>HopWord<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "kl", "<cmd>HopLine<cr>", { silent = true })
   -- vim.api.nvim_set_keymap("n", "P", "<cmd>HopPattern<cr>", { silent = true })
