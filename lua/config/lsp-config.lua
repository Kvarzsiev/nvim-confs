-- Setup language servers.
local lspconfig = require("lspconfig")

local on_attach = function(client)
  -- require("completion").on_attach(client)
end

require("flutter-tools").setup({
  fvm = true,
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
  },
}) -- use defaults

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      rustfmt = {
        overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
      },
      cargo = {
        features = "all",
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
})
