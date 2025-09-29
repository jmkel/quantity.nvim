# quantity.nvim

A simple line counter for Neovim that tracks how much code you write. Built this to help me focus on shipping code instead of overthinking it.

## What it does

Tracks lines added/removed in your current session. That's it. Shows you a little summary when you want to see your progress.

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
