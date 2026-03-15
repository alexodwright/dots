-- ~/.config/nvim/lua/lualine/themes/candle-grey-lualine.lua
local colors = {
  bg_dark   = '#1a1a1a',
  bg        = '#232323',
  bg_light  = '#2e2e2e',
  fg_dim    = '#555555',
  fg        = '#888888',
  fg_bright = '#b0b0b0',
  white     = '#d4d4d4',
}

return {
  normal = {
    a = { fg = colors.bg_dark,  bg = colors.fg_bright, gui = 'bold' },
    b = { fg = colors.fg,       bg = colors.bg_light },
    c = { fg = colors.fg_dim,   bg = colors.bg },
  },
  insert = {
    a = { fg = colors.bg_dark,  bg = colors.white, gui = 'bold' },
    b = { fg = colors.fg,       bg = colors.bg_light },
    c = { fg = colors.fg_dim,   bg = colors.bg },
  },
  visual = {
    a = { fg = colors.bg_dark,  bg = colors.fg,       gui = 'bold' },
    b = { fg = colors.fg,       bg = colors.bg_light },
    c = { fg = colors.fg_dim,   bg = colors.bg },
  },
  replace = {
    a = { fg = colors.fg_bright, bg = colors.bg_light, gui = 'bold' },
    b = { fg = colors.fg,        bg = colors.bg_light },
    c = { fg = colors.fg_dim,    bg = colors.bg },
  },
  command = {
    a = { fg = colors.bg,       bg = colors.fg_dim,   gui = 'bold' },
    b = { fg = colors.fg,       bg = colors.bg_light },
    c = { fg = colors.fg_dim,   bg = colors.bg },
  },
  inactive = {
    a = { fg = colors.fg_dim,   bg = colors.bg },
    b = { fg = colors.fg_dim,   bg = colors.bg },
    c = { fg = colors.fg_dim,   bg = colors.bg },
  },
}
