local function get_current_iso_week()
	local now = os.date("*t")
	-- Calculate ISO week number
	local jan1 = os.time({ year = now.year, month = 1, day = 1 })
	local days = math.floor(os.difftime(os.time(now), jan1) / (24 * 60 * 60))
	local wday = os.date("*t", jan1).wday
	-- Adjust so Monday=1 … Sunday=7
	local iso_day = (now.wday + 6) % 7 + 1
	local week = math.floor((days + wday - 1) / 7) + 1
	return string.format("%04d-W%02d", now.year, week)
end

return {
	"chipsenkbeil/org-roam.nvim",
	tag = "0.2.0",
	dependencies = {
		{
			"nvim-orgmode/orgmode",
			tag = "0.7.0",
			config = function()
				local orgmode = require("orgmode")
				orgmode.setup({
					-- Your orgmode config here
					org_agenda_files = vim.fn.expand("~/org_roam_files/**/*"),
					org_default_notes_file = vim.fn.expand("~/org_roam_files/notes.org"),
					org_agenda_show_subtree = true,
					org_agenda_window_setup = "other",
					org_todo_keywords = { "TODO", "WIP", "|", "DONE" },
					org_agenda_custom_commands = {
						r = {
							description = "Recent 5 days journal entries",
							command = "agenda",
							files = { vim.fn.expand("~/org_roam_files/journal.org") },
							start_day = "-4d",
							span = 5,
							header = "Recent Journal (past 5 days)",
							repeating = true,
							reversed = true,
						},
					},
				})
			end,
		},
	},
	config = function()
		local week = get_current_iso_week()
		require("org-roam").setup({
			directory = "~/org_roam_files",
			templates = {
				d = {
					description = "default",
					template = "%?",
					target = "%<%Y%m%d%H%M%S>-%[slug].org",
				},
				j = {
					description = "Journal entry",
					template = "* %?\n<%<%Y-%m-%d %a %H:%M>>\n", -- always insert an active timestamp
					target = "~/org_roam_files/journal.org",
					datetree = true, -- keep the daily hierarchy
				},

				o = {
					description = "1:1 meeting",
					target = "~/org_roam_files/one_on_one_meeting.org",
					template = string.format(
						[[
* Week %s
:PROPERTIES:
:CREATED: %s
:END:

** Actions
- [ ] 

** Agenda
- 

** Notes
- 
          ]],
						week,
						"%U"
					),
				},
				target = {
					type = "node",
				},
			},
			org_files = {
				"~/another_org_dir",
				"~/some/folder/*.org",
				"~/a/single/org_file.org",
			},
		})
	end,
}
