local present, alpha = pcall(require, 'alpha')
if not present then return end

local header = {
    type = "text",
    val = {
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⡀⡢⢂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢄⢮⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⡠⡂⣊⠢⡑⡐⠄⠀⠀⠀⠀⠀⠀⢀⢔⡕⣕⢗⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠢⠨⢢⠢⡃⡪⡐⡑⢄⠀⠀⠀⠀⢰⢱⡣⣫⢪⢮⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⡑⠅⢅⠣⡊⡢⡊⢌⠢⡂⡀⠀⠀⢐⢧⢳⢕⢧⢳⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠪⡨⠢⠡⡑⠰⡘⡌⡪⡂⡆⠄⠀⢐⡕⣗⢕⡗⡵⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠕⢌⠪⡨⢌⠀⠘⡰⡑⡌⡪⡊⣂⠀⡯⣪⡳⣹⡪⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠕⡅⠕⢌⠢⠀⠀⠀⢕⢅⢇⢕⢒⢬⢺⢕⢽⢜⢮⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⢕⢘⠜⢌⠪⠀⠀⠀⠀⠪⡢⡣⡣⡣⡳⣹⢕⢯⡳⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⢕⢅⢣⢑⠕⠀⠀⠀⠀⠀⠘⢜⢌⢎⢞⢎⢯⡳⡝⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⢕⢌⠆⠁⠀⠀⠀⠀⠀⠀⠀⠈⢎⢎⣗⢽⠑⠉⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠕⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠣⠓⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀neovim⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    },
    opts = { position = "center", hl = "String" },
}

local function button(sc, txt, keybind, keybind_opts)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")
  local opts = {
    cursor = 5,
    width = 50,
    shortcut = sc,
    position = "center",
    hl_shortcut = "Keyword",
    align_shortcut = "right",
  }
  if keybind then
    keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { "n", sc_, keybind, keybind_opts }
  end

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
    vim.api.nvim_feedkeys(key, "normal", false)
  end

  return {
    val = txt,
    opts = opts,
    type = "button",
    on_press = on_press,
  }
end

local buttons = {
  type = "group",
  val = {
    button("n", "  new file", "<cmd>ene <cr>"),
    button("f", "  search files", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>"),
    button("s", "  search sessions", "<cmd>Telescope sessions<cr>"),
  },
  opts = { spacing = 0 },
}

local section = {
  header = header,
  buttons = buttons,
}

local opts = {
  layout = {
    { type = "padding", val = 2 },
    section.header,
    { type = "padding", val = 2 },
    section.buttons,
  },
  opts = { margin = 5 },
}

alpha.setup(opts)