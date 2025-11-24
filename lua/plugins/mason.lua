return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "eslint_d", -- fast eslint daemon
      "prettierd", -- fast prettier daemon (highly recommended over plain prettier)
      "angular-language-server",
    },
  },
}
