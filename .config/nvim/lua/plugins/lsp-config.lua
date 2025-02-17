return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "eslint", "ts_ls", "lua_ls", "bashls", "dockerls", "docker_compose_language_service" }
      })
    end,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      --[[lspconfig.eslint.setup({
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern(
          '.eslintrc',
          '.eslintrc.js',
          '.eslintrc.cjs',
          '.eslintrc.yaml',
          '.eslintrc.yml',
          '.eslintrc.json'
        -- Disabled to prevent "No ESLint configuration found" exceptions
        -- 'package.json',
        ),
      })]]
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.tsserver.setup({
        { capabilities = capabilities },
        settings = {
          tsserver = {
            trace = {
              server = "verbose" -- veya "off" ile kapatın
            }
          }
        },
        on_attach = function(client, bufnr)
          print("TSServer root directory:", client.config.root_dir)
        end,
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
      })
      lspconfig.bashls.setup({ capabilities = capabilities },
        {
          settings = {
            bashIde = {
              shellcheckPath = "shellcheck",
              shfmtPath = "shfmt"
            }
          }
        })
      lspconfig.dockerls.setup({ capabilities = capabilities })
      lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
