for _, language in ipairs({ "typescript", "javascript" }) do
    require("dap").configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch File",
            sourceMaps = true,
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            sourceMaps = true,
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch Chrome",
            sourceMaps = true,
            url = "http://localhost:4200",
            webRoot = "${workspaceFolder}",
        },
        {
            type = "pwa-chrome",
            request = "attach",
            name = "Attach Chrome",
            sourceMaps = true,
            protocol = "inspector",
            cwd = vim.fn.getcwd(),
            url = "http://localhost:4200",
            port = 9222,
            webRoot = "${workspaceFolder}",
        }
    }
end
