local o = vim.opt
o.guicursor = ""
o.number = true
o.spelllang = "en_gb"
o.spelloptions:append("camel")
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true


vim.diagnostic.config({
  virtual_text = {
    prefix = "●",  -- or "▲", "■", etc.
    spacing = 4,
  },
})
