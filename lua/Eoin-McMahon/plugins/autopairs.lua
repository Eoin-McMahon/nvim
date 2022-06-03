local _npairs, npairs = pcall(require, "nvim-autopairs")
if not _npairs then
	return
end

npairs.setup({
	check_ts = true,
	disable_filetype = { "TelescopePrompt" },
})

-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- local _cmp, cmp = pcall(require, "cmp")

-- if _cmp then
--  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
-- end

if _autotag then
  autotag.setup()
end
