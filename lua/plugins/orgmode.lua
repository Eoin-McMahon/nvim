return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	config = function()
		local orgmode = require("orgmode")

		orgmode.setup({
			org_agenda_files = "~/org_roam_files/**/*",
			org_default_notes_file = "~/org_roam_files/notes.org",
			org_agenda_show_subtree = true, -- show child bullets in agenda

			org_agenda_window_setup = "tab", -- open agenda in vertical split

			org_todo_keywords = { "TODO", "WIP", "|", "DONE" },

			-- Capture template: active timestamp under heading, no datetree
			org_capture_templates = {
				j = {
					description = "Journal entry",
					template = "* %?\n<%<%Y-%m-%d %a %H:%M>>\n", -- always insert an active timestamp
					target = "~/org_roam_files/20251121132222-journal.org",
					datetree = true, -- keep the daily hierarc
				},
			},

			-- Custom agenda command: show last 5 days
			org_agenda_custom_commands = {
				r = {
					description = "Recent 5 days journal entries",
					types = {
						{
							type = "agenda",
							org_agenda_files = { "~/org_roam_files/20251121132222-journal.org" },
							org_agenda_start_day = "-4d", -- 4 days ago
							org_agenda_span = 5, -- total 5 days
							org_agenda_overriding_header = "Recent Journal (past 5 days)",
							org_agenda_repeating = true,
							org_agenda_reversed = true,
						},
					},
				},
			},
		})
	end,
}
