local present, scrollbar = pcall(require, "scrollbar")
if not present then return end

local handle = { text = " ", color = "white" }
local marks = {
  Error = { color = "red" },
  Info = { color = "blue" },
  Hint = { color = "green" },
  Warn = { color = "yellow" },
  Misc = { color = "purple" },
  Search = { color = "orange" },
}

local theme_present, theme = pcall(require, "afreidz.theme.colors")
if present then 
  local colors = theme
  handle.color = colors.black3
  marks.Hint.color = colors.sky
  marks.Info.color = colors.teal
  marks.Error.color = colors.red
  marks.Warn.color = colors.yellow
  marks.Search.color = colors.mauve
  marks.Misc.color = colors.flamingo
end

scrollbar.setup({
  marks = marks,
  handle = handle,
  excluded_filetypes = { "nvimtree", "NvimTree" },
})
