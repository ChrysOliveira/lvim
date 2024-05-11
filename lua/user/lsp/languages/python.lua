-- automatically install python syntax highlighting
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

-- setup formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, }
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.py" }

-- setup linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", filetypes = { "python" } } }

local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")

local dap = require("dap")
dap.configurations.python = {
  {
    type = 'debugpy',
    request = 'launch',
    name = 'My custom launch configuration',
    console = "integratedTerminal",
    program = '${file}',
  }
  -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
}
