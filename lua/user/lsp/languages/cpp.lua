
local dap = require("dap")
dap.adapters.codelldb = {
  type = 'server',
  port = 1300,
  executable = {
    -- CHANGE THIS to your path!
    command = 'codelldb',
    args = {"--port", 1300},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
  {
    name = "Compile and debug",
    type = "codelldb",
    request = "launch",
    program = function()
      vim.fn.system('clang++ *.cpp -o main')
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

