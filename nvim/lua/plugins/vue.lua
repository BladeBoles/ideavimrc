return {
  -- Ensure Vue language server is properly configured
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Vue language server in hybrid mode
        volar = {
          filetypes = { "vue" },
          init_options = {
            vue = {
              hybridMode = true, -- This is the key setting
            },
          },
        },
        -- VTSLS for TypeScript support in Vue files
        vtsls = {
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
          settings = {
            vtsls = {
              tsserver = {
                globalPlugins = {
                  {
                    name = "@vue/typescript-plugin",
                    location = require("lazy.core.config").options.root
                      .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                    languages = { "vue" },
                    configNamespace = "typescript",
                    enableForWorkspaceTypeScriptVersions = true,
                  },
                },
              },
            },
          },
        },
      },
    },
  },

  -- Ensure required parsers are installed
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "vue", "css", "html", "javascript", "typescript" },
    },
  },
}
