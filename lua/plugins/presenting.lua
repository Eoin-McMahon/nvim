return {
	"sotte/presenting.nvim",
	cmd = { "Presenting" },
	opts = {
		-- Split slides on the `---` horizontal rules, not on headings: the deck's
		-- code blocks contain Python `#` comments, which the default `^#+ `
		-- separator would wrongly treat as slide boundaries.
		separator = {
			markdown = "^---$",
		},
		keep_separator = false,
		options = {
			width = 120,
		},
	},
}
