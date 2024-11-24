return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp"
  },
  opts = {
    servers = {}
  },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    require("mason").setup()
    require("mason-lspconfig").setup {
      handlers = {
        function(server_name)
          local config = opts.servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for ts_ls)
          config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
          lspconfig[server_name].setup(config)
        end,
      },
    }
  end
}

