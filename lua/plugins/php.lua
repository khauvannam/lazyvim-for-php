return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "pint", "php_cs_fixer" },
        blade = { "blade-formatter" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "" },
      },
      -- linters = {
      --   phpstan = {
      --     args = { "-l max", "--error-format=json", "--memory-limit 1G" },
      --   },
      -- },
    },
  },
}
