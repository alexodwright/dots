return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        -- add the config here
	themes = {"tokyonight-storm", "tokyonight-night", "tokyonight-moon", "tokyonight-day", "kanagawa-wave", "kanagawa-lotus", "kanagawa-dragon", "catppuccin-latte", "catppuccin-frappe", "catppuccin-macchiato", "catppuccin-mocha", "candle-grey"},
	livePreview = true;
      })
    end
  }
