return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup {
      theme = "dragonOrange",
      transparent = true,
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
      overrides = function(colors)
        local palette = colors.palette
        -- test
        return {
          Comment = { fg = palette.dragonGreen2, italic = false },
          LineNr = { fg = palette.dragonGray2, bg = "NONE" },
          CursorLineNr = { fg = palette.dragonOrange, bg = "NONE" },
          SignColumn = { bg = "NONE" },
          FoldColumn = { bg = "NONE" },
          GitSignsAdd = { bg = "NONE" },
          GitSignsChange = { bg = "NONE" },
        }
      end,
    }
    vim.cmd [[colorscheme kanagawa-dragon]]

    local bg_transparent = true
    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      require("kanagawa").setup { transparent = bg_transparent }
      vim.cmd [[colorscheme kanagawa-dragon]]
    end

    vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
  end,
}
