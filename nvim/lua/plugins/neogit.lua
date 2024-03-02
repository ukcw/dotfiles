return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  keys = {
    -- add keymap to open Neogit
    { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
  },
  config = true,
}
