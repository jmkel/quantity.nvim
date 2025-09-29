# quantity.nvim

A simple line counter for Neovim that tracks how much code you write in current buffer.

## What it does

Tracks lines added/removed in your current session. Shows you a little summary when you want to see your progress.

## Installation

With lazy.nvim:
```lua
{
  "jmkel/quantity.nvim",
  config = function()
    require("quantity").setup()
  end,
  keys = {
    { "<leader>qs", "<cmd>QuantityStats<cr>", desc = "Show quantity stats" },
  },
}
