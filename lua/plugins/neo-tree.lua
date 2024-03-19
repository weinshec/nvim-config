local M = { 'nvim-neo-tree/neo-tree.nvim', branch = 'v3.x' }

M.dependencies = {
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",
}

M.opts = {
  close_if_last_window = true,
}

M.keys = {
  { "<leader>n", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
}

return M
