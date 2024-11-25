return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    { "williamboman/mason-lspconfig.nvim", config = function() end },
    { 'j-hui/fidget.nvim', config = true },
    "saghen/blink.cmp"
  },
  opts = {
    servers = {
      -- rust_analyzer = {},
    },
    inlay_hints = {
      enabled = true,
    }
  },
  config = function(_, opts)
    vim.lsp.set_log_level("debug")

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require("blink.cmp").get_lsp_capabilities() or {},
      opts.capabilities or {}
    )

    require("mason-lspconfig").setup {
      handlers = {
        function(server_name)
          local server_config = vim.tbl_deep_extend("force", {
            capabilities = vim.deepcopy(capabilities),
          }, opts.servers[server_name] or {})
          require("lspconfig")[server_name].setup(server_config)
        end,
      },
    }
  end
}

