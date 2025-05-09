return {
  "Pocco81/auto-save.nvim",
  lazy = false,
  opts = {
    execution_message = {
      message = function()
        return ""
      end,
    },
  },
  keys = {
    { "<leader>uv", "<cmd>ASToggle<CR>", desc = "Toggle autosave" },
  },
}
