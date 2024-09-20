-------------------- Table of Contents ----------------------
-- 1. Normal options
--   a. MapLeader
--   b. Lines
--   c. Splitting
--   d. Case sensitivity
--   e. Timeouts
--   f. Weird character handling
--   g. Misc
-- 2. Keymaps
--   a. Window management
--   b. Buffer management
--   c. LSP
--   d. Misc
-- 3. Autocommands
--   a. Highlight yank
--   b. Open neotree on startup
-- 4. Plugin setup
--   a. Misc
-------------------------------------------------------------

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 1. Normal options
--   a. MapLeader
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--   b. Lines
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.breakindent = true
vim.opt.showbreak = "󱞩 "
vim.opt.breakindentopt = { "shift:0" }

--   c. Splitting
vim.opt.splitright = false
vim.opt.splitbelow = true

--   d. Case sensitivity
vim.opt.ignorecase = true
vim.opt.smartcase = true

--   e. Timeouts
vim.opt.updatetime = 1000
vim.opt.timeoutlen = 300

--   f. Weird character handling
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- --   g. Misc
vim.g.have_nerd_font = true
vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.inccommand = "split"
vim.opt.incsearch = true
vim.opt.scrolloff = 10
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.hidden = true

-- 2. Keymaps
--   a. Window management
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

--   b. Buffer management
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Move to next tab" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = "Move to previous tab" })

--   c. LSP
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "🏷️ Rename Symbol" })
vim.keymap.set({ "n", "x" }, "<leader>a", vim.lsp.buf.code_action, { desc = "✨ Action" })

--   d. Neotree
vim.keymap.set("n", "<Leader>f", "<cmd>Neotree toggle<CR>", { desc = "🌲 Neotree" })
vim.keymap.set("n", "<Leader>F", "<cmd>Neotree toggle position=current<CR>", { desc = "🌳 Big Neotree" })

--   e. Diffview
vim.keymap.set("n", "<Leader>d", function ()
    if next(require("diffview.lib").views) == nil then
      vim.cmd("DiffviewOpen")
    else
      vim.cmd("DiffviewClose")
    end
  end,
  { desc = "🔀 Diffview" }
)

--   f. Misc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- 3. Autocommands
--   a. Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--   b. Open Neotree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Open Neotree in fullscreen when a specific file isn\"t opened",
  group = vim.api.nvim_create_augroup("neotree-startup", { clear = true }),
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd("Neotree position=current")
    end
  end
})

--   c. Auto update plugins
vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Auto update plugins via lazy",
  group = vim.api.nvim_create_augroup("lazy-startup", { clear = true }),
  callback = function()
    require("lazy").update()
  end
})

-- 4. Plugin setup
--   a. Misc
require("config.lazy")
