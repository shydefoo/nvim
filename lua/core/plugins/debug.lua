return {
    { "mfussenegger/nvim-dap", event = "VeryLazy" },
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
}
