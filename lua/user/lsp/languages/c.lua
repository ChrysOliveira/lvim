local dap = require("dap")

dap.configurations.c = {
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
      local filename = vim.fn.expand("%:r")
      vim.fn.system('gcc -fdiagnostics-color=always -g *.c -o ' .. filename .. ' -lm')
      -- vim.fn.system('gcc -fdiagnostics-color=always -g *.c -o main -lm')
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
