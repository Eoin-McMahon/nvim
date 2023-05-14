local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.opt.termguicolors = true

require("bufferline").setup {
    options = {
        numbers = "ordinal",
        offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
        diagnostics = "nvim_lsp",
        hover = {
            enabled = true,
            delay = 150,
            reveal = {'close'}
        },
    }
}

function GotoBuffer(number)
  vim.cmd('BufferGoto ' .. number)
end

-- keymaps for changing buffer
keymap('n', '<leader>b<number>', ':<C-u>lua GotoBuffer(vim.v.count)<CR>', { silent = true })

-- keymap("n", "<leader>b", ":BufferLinePick<CR>", opts)
keymap("n", "<leader>bn", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<leader>bp", ":BufferLineCyclePrev<CR>", opts)

keymap("n", "<leader>bc", ":BufferLinePickClose<CR>", opts)
keymap("n", "<leader>bs", ":BufferLineSortByDirectory<CR>", opts)

