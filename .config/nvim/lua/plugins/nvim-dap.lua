return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dotnet = require("config.nvim-dap-dotnet")
    local dap = require("dap")
    local mason_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"
    local netcoredbg_adapter = {
      type = "executable",
      command = mason_path,
      args = { "--interpreter=vscode" },
    }
    dap.adapters.netcoredbg = netcoredbg_adapter -- needed for normal debugging
    dap.adapters.coreclr = netcoredbg_adapter -- needed for unit test debugging
    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          local project_dir = vim.fn.getcwd()
          local build_exit = vim.fn.system("dotnet build " .. project_dir)
          if vim.v.shell_error ~= 0 then
            error("Build failed:\n" .. build_exit)
          end
          return dotnet.build_dll_path()
          -- return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net9.0", "file")
        end,
      },
    }
  end,
}
