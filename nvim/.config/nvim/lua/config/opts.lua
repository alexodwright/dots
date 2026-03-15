local o = vim.opt
o.guicursor = ""
o.number = true
o.spelllang = "en_gb"
o.spelloptions:append("camel")

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",  -- or "▲", "■", etc.
    spacing = 4,
  },
})
