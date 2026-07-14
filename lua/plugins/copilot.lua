return {
	"zbirenbaum/copilot-cmp",
	event = "InsertEnter",
	dependencies = { "zbirenbaum/copilot.lua" },
	config = function()
		-- We only want cmp functionality
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
		require("copilot_cmp").setup()
	end,
}
