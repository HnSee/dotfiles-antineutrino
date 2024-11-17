return {
  { "Shatur/neovim-ayu", lazy = true, name = "ayu" },
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = true,
    name = "oxocarbon",
    opts = function()
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oxocarbon",
    },
  },
}
