return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          local builtin = require("telescope.builtin")

          map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
          map("gD", builtin.lsp_definitions, "[G]oto [D]eclaration")
          map("gr", builtin.lsp_references, "[G]oto [R]eferences")
          map("gi", builtin.lsp_implementations, "[G]oto [I]mplementation")
          map("gt", builtin.lsp_type_definitions, "[G]oto [T]ype") -- might need to change, this is used for tabs normally
        end
      })

      --   a. Lua
      require("lspconfig").lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
              disable = { "missing-fields" }
            },
            completion = {
              callSnippet = "Replace"
            }
          }
        }
      }

      --  b. Zig
      require("lspconfig").zls.setup {}
    end
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } }
      }
    }
  },

  -- Rust
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
  }
}
