-- Additional Plugin
lvim.plugins = {
    {
        'editorconfig/editorconfig-vim'
    },
    {
        "elgiano/nvim-treesitter-angular",
        branch = "topic/jsx-fix"
    },
    {
        "akinsho/flutter-tools.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("flutter-tools").setup({
                ui = {
                    border = "rounded"
                },
                decorations = {
                    statusline = {
                        app_version = true,
                        device = true
                    }
                },
                debugger = {
                    enabled = true,
                    run_via_dap = true,
                    register_configurations = function()
                        require("dap").configurations.dart = {
                            {
                                name = "Debug",
                                request = "launch",
                                type = "dart"
                            }
                        }
                    end
                },
                widget_guides = {
                    enabled = false
                },
                dev_log = {
                    enabled = true,
                    open_cmd = "tabedit"
                },
                lsp = {
                    on_attach = require("lvim.lsp").common_on_attach,
                    -- capabilities = require("lvim.lsp").common_capabilities
                }
            })
        end,
        ft = "dart"
    },
    { 'Neevash/awesome-flutter-snippets' },
    { 'dart-lang/dart-vim-plugin' },
    {
        "kosayoda/nvim-lightbulb",
        requires = "antoinemadec/FixCursorHold.nvim",
        config = function()
            require("nvim-lightbulb").setup({
                autocmd = { enabled = true }
            })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "mxsdev/nvim-dap-vscode-js",
        requires = "mfussenegger/nvim-dap",
        config = function()
            require("dap-vscode-js").setup({
                debugger_path = os.getenv("HOME") .. "/.config/vscode-plugins/vscode-js-debug",
                adapters = {
                    "pwa-node",
                    "pwa-chrome",
                    "node-terminal",
                    "paw-extensionHost"
                }
            })

            require("configurations.debug")
        end
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "f-person/git-blame.nvim",
        event = "BufRead",
        config = function()
            vim.cmd "highlight default link gitblame SpecialComment"
            vim.g.gitblame_enabled = 0
        end,
    },
    {
        "nacro90/numb.nvim",
        event = "BufRead",
        config = function()
            require("numb").setup {
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
            }
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function()
            local signature_config = {
                log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
                debug = true,
                hint_enable = false,
                handler_opts = { border = "single" },
                max_width = 80,
            }

            require("lsp_signature").setup(signature_config)
        end,
    },
    {
        "windwp/nvim-spectre",
        event = "BufRead",
        config = function()
            require("spectre").setup({
                live_update = false,
            })
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require('symbols-outline').setup()
        end
    },
    {
        "ethanholz/nvim-lastplace",
        event = "BufRead",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = {
                    "gitcommit", "gitrebase", "svn", "hgcommit",
                },
                lastplace_open_folds = true,
            })
        end,
    },
    {
        "tpope/vim-surround",
    },
    {
        "tpope/vim-repeat"
    },
    {
        "ggandor/leap.nvim",
    },
    -- Themes
    {
        'marko-cerovac/material.nvim'
    },
    {
        "kyazdani42/blue-moon",
    },
    {
        'andersevenrud/nordic.nvim',
    },
    {
        'shaunsingh/nord.nvim',
    },
    {
        'frenzyexists/aquarium-vim',
    }
}

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.autotag.enable = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
    "html",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.telescope.extensions["ui-select"] = {
    require("telescope.themes").get_dropdown({})
}

-- Telescope
lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "flutter")
    pcall(telescope.load_extension, "ui-select")
end
