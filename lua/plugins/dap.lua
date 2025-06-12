return {
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"jay-babu/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function(_, opts)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
			local dap_virtual_text = require("nvim-dap-virtual-text")

			-- Dap Virtual Text
			dap_virtual_text.setup()
			require("mason").setup()
			require("mason-nvim-dap").setup()
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			--
			-- 🎯 DAP Breakpoint Signs
			vim.fn.sign_define("DapBreakpoint", { text = "🐞", texthl = "DiagnosticSignError" }) -- Standard Breakpoint
			vim.fn.sign_define(
				"DapStopped",
				{ text = "👉", texthl = "DiagnosticSignWarn", linehl = "Visual", numhl = "DiagnosticSignWarn" }
			)
			vim.fn.sign_define("DapBreakpointCondition", { text = "🎯", texthl = "DiagnosticSignHint" }) -- Conditional Breakpoint
			vim.fn.sign_define("DapBreakpointRejected", { text = "❌", texthl = "DiagnosticSignError" }) -- Rejected Breakpoint
			vim.fn.sign_define("DapLogPoint", { text = "📌", texthl = "DiagnosticSignInfo" }) -- Log Point

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
