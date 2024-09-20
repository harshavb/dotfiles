return {
  --[[
  {
    "morhetz/gruvbox",
    priority = 1000,
    init = function()
      vim.cmd.colorscheme "gruvbox"
    end
  }
  --]]
  {
    "ofirgall/ofirkai.nvim",
    priority = 1000,

    config = function()
      require("ofirkai").setup {
        remove_italics = true
      }
    end
  }
}
