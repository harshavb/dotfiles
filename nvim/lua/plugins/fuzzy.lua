return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close
            }
          }
        }
      })

      -- keymaps
      local builtin = require "telescope.builtin"

      vim.keymap.set("n", "<Leader>s", "", { desc = "[S]earch" })
      vim.keymap.set("n", "<Leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
      vim.keymap.set("n", "<Leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
      vim.keymap.set("n", "<Leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
      vim.keymap.set("n", "<Leader>sw", builtin.grep_string, { desc = "[S]earch [W]ord" })
      vim.keymap.set("n", "<Leader>sg", builtin.live_grep, { desc = "[S]earch [G]rep" })
      vim.keymap.set("n", "<Leader>sr", builtin.oldfiles, { desc = "[S]earch [R]ecent" })
      vim.keymap.set("n", "<Leader>so",
        function ()
          builtin.live_grep {
            grep_open_files = true,
            prompt_title = "Live Grep in Open Files"
          }
        end, { desc = "[S]earch [O]pen Files" }
      )

      vim.keymap.set("n", "<Leader>/", builtin.current_buffer_fuzzy_find, { desc = "Search Current File" })
    end
  }
}
