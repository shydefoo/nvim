local home_dir = os.getenv("HOME")
return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        config = function()
            local dap = require('dap')
            dap.adapters.python = function(cb, config)
                if config.request == 'attach' then
                    ---@diagnostic disable-next-line: undefined-field
                    local port = (config.connect or config).port
                    ---@diagnostic disable-next-line: undefined-field
                    local host = (config.connect or config).host or '127.0.0.1'
                    cb({
                        type = 'server',
                        port = assert(port, '`connect.port` is required for a python `attach` configuration'),
                        host = host,
                        options = {
                            source_filetype = 'python',
                        },
                    })
                else
                    cb({
                        type = 'executable',
                        command = home_dir .. '/.virtualenvs/debugpy/bin/python',
                        args = { '-m', 'debugpy.adapter' },
                        options = {
                            source_filetype = 'python',
                        },
                    })
                end
            end
            dap.configurations.python = {
                {
                    -- The first three options are required by nvim-dap
                    type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
                    request = 'launch',
                    name = "Launch file",

                    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

                    program = "${file}", -- This configuration will launch the current file if used.
                    pythonPath = function()
                        return vim.fn.exepath("python")
                    end,
                    env = { PYTHONPATH = vim.fn.getcwd() }
                },
            }
        end
    },
    { "leoluz/nvim-dap-go", config = true, event = "VeryLazy" },
    opt = {
        dap_configurations = {
            {
                -- Must be "go" or it will be ignored by the plugin
                type = "go",
                name = "Attach remote",
                mode = "remote",
                request = "attach",
            },
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            require("dapui").setup()
            local dap, dapui = require("dap"), require("dapui")
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
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        event = "VeryLazy"
    },
    -- {
    --     "mfussenegger/nvim-dap-python",
    --     config = function()
    --         require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
    --     end
    -- }
}
