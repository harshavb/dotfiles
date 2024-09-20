return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function ()
      require("bufferline").setup {
        highlights = require("ofirkai.tablines.bufferline").highlights,
        options = {
          themable = true,
          separator_style = "slant",
          offsets = { { filetype = "NvimTree", text = "File Explorer", text_aline = "center" } },
          show_buffer_icons = true,
          numbers = "ordinal",
          max_name_length = 40,
        }
      }
    end
  }
}
