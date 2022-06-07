vim.opt.background = "dark"
vim.g.colors_name = "lush-base16"

package.loaded["lush_theme.lush-base16"] = nil

require("lush")(require("lush_theme.lush-base16"))
