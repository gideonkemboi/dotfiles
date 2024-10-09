local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "black" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 15000,
    lsp_fallback = true,
  },
}

return options
