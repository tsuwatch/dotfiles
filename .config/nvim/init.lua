-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Options
vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.scrolloff = 5
vim.opt.swapfile = false
vim.opt.list = true
vim.opt.listchars = { eol = "¬", tab = "▸ " }
vim.opt.showmatch = true
vim.opt.whichwrap = "b,s,h,l,[,],<,>"
vim.opt.backspace = "indent,eol,start"
vim.opt.laststatus = 2
vim.opt.showtabline = 2

-- Keymaps
vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "0", "$")
vim.keymap.set("n", "1", "0")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<down>", "gj")
vim.keymap.set("n", "<up>", "gk")
vim.keymap.set("i", "<C-a>", "<Home>")
vim.keymap.set("i", "<C-e>", "<End>")
vim.keymap.set("i", "<C-b>", "<Left>")
vim.keymap.set("i", "<C-f>", "<Right>")
vim.keymap.set("i", "<C-d>", "<Del>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("i", "kk", "<ESC>", { silent = true })

-- Plugins
require("lazy").setup({
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    lazy = false,
    config = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { theme = "auto" },
      sections = {
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })
      -- 引数なしで起動したときだけファイルツリーを開く
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() == 0 then
            require("nvim-tree.api").tree.open()
          end
        end,
      })
    end,
  },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Help tags" },
    },
  },
  {
    "lmilojevicc/herdr-splits.nvim",
    cond = vim.env.HERDR_ENV == "1", -- Herdr 内でのみ有効化
    event = "VeryLazy",
    build = ':lua require("herdr-splits").sync_herdr()',
    config = function()
      require("herdr-splits").setup()
      local splits = require("herdr-splits")
      -- Ctrl+hjkl でNeovim分割とHerdrペインを移動
      vim.keymap.set("n", "<C-h>", splits.move_cursor_left, { desc = "Navigate left" })
      vim.keymap.set("n", "<C-j>", splits.move_cursor_down, { desc = "Navigate down" })
      vim.keymap.set("n", "<C-k>", splits.move_cursor_up, { desc = "Navigate up" })
      vim.keymap.set("n", "<C-l>", splits.move_cursor_right, { desc = "Navigate right" })
      -- Alt+hjkl でリサイズ
      vim.keymap.set("n", "<M-h>", splits.resize_left, { desc = "Resize left" })
      vim.keymap.set("n", "<M-j>", splits.resize_down, { desc = "Resize down" })
      vim.keymap.set("n", "<M-k>", splits.resize_up, { desc = "Resize up" })
      vim.keymap.set("n", "<M-l>", splits.resize_right, { desc = "Resize right" })
    end,
  },
})
