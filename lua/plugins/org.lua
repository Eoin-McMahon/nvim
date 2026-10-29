return {
	"xheisenbugx/org.nvim",
	main = "org",
	lazy = false, -- startup cost is small: heavy modules load on first use
	opts = {
		-- Files: where org lives. Everything captured lands in refile.org,
		-- and the agenda scans every .org file under ~/org (including notes/).
		org_directory = "~/org",
		agenda_files = { "~/org/**/*.org" },
		default_notes_file = "~/org/refile.org",

		-- TODO states: (t) style letters are fast-selection keys.
		-- Everything before "|" is an open state, everything after is finished.
		todo_keywords = { "TODO(t) WAITING(w) | DONE(d) CANCELLED(c)" },

		-- Logging: add a CLOSED: timestamp when an entry is marked DONE, and
		-- keep state-change logs inside a :LOGBOOK: drawer so the body stays clean.
		log_done = "time",
		log_into_drawer = true,

		-- Agenda: window = "split" is the default horizontal split under your
		-- file. restore_windows_after_quit puts the window layout back as it was
		-- before the agenda was opened when you quit it with q.
		-- Shows a week, hides finished items, and warns about deadlines 14 days ahead.
		agenda = {
			window = "split",
			restore_windows_after_quit = true,
			span = "week",
			skip_scheduled_if_done = true,
			skip_deadline_if_done = true,
		},
		deadline_warning_days = 14,

		-- Appearance: virtual indentation under headings, only the last star
		-- shown per headline, and no *bold* / /italic/ marker characters.
		ui = {
			indent_mode = true,
			hide_leading_stars = true,
			hide_emphasis_markers = true,
		},

		-- Capture (<leader>oc): t is a plain todo, n is a note.
		-- %? is the cursor position and %U stamps the creation time.
		-- Add a date afterwards with <leader>od (deadline) or <leader>os (schedule).
		capture = {
			templates = {
				t = { description = "Todo", template = "* TODO %?\n  %U", target = "~/org/refile.org" },
				n = { description = "Note", template = "* %?\n  %U", target = "~/org/notes.org" },
			},
		},

		-- Refile (<leader>or): move an entry into any agenda file, down to
		-- the second heading level. The prompt shows the file name and lists
		-- the full path at once instead of one level at a time.
		refile = {
			max_level = 2,
			use_outline_path = "file",
			outline_path_complete_in_steps = false,
		},
	},
}
