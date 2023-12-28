return {
  -- {
  --   "shaunsingh/nord.nvim",
  --   config = function() require("nord").set() end,
  --   init = function()
  --     vim.g.nord_italic = false
  --   end
  -- },
  {
    "nordtheme/vim",
  },
  {
    "frenzyexists/aquarium-vim",
    init = function() vim.g.aquarium_style = "dark" end,
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "xiyaowong/transparent.nvim",
    event = "VeryLazy",
    init = function() require("transparent").toggle(true) end,
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    opts = {
      ignore_lsp = { "lua_ls", "julials" },
    },
    config = function(_, opts) require("project_nvim").setup(opts) end,
  },
  {
    "editorconfig/editorconfig-vim",
  },
  {
    "nvim-treesitter/playground",
    event = "BufRead",
  },
  {
    "elgiano/nvim-treesitter-angular",
    branch = "topic/jsx-fix",
  },
  {
    "dart-lang/dart-vim-plugin",
    event = { "BufEnter *.dart" },
  },
  {
    "akinsho/flutter-tools.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("flutter-tools").setup {
        ui = {
          border = "rounded",
        },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          },
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
          register_configurations = function()
            require("dap").configurations.dart = {
              {
                name = "Debug",
                request = "launch",
                type = "dart",
              },
            }
          end,
        },
        widget_guides = {
          enabled = false,
        },
        closing_tags = {
          highlight = "ErrorMsg", -- highlight for the closing tag
          prefix = ">",           -- character to use for close tag e.g. > Widget
          enabled = true          -- set to false to disable
        },
      }
    end,
    ft = "dart",
  },
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     local signature_config = {
  --       log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
  --       debug = true,
  --       hint_enable = false,
  --       handler_opts = { border = "single" },
  --       max_width = 80,
  --     }
  --
  --     require("lsp_signature").setup(signature_config)
  --   end,
  -- },
  {
    "windwp/nvim-ts-autotag",
    config = function() require("nvim-ts-autotag").setup() end,
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
    "simrat39/symbols-outline.nvim",
    event = "User AstroFile",
    config = function() require("symbols-outline").setup() end,
  },
  {
    event = "User AstroFile",
    "tpope/vim-surround",
  },
  {
    "tpope/vim-repeat",
  },
  {
    "jabirali/vim-tmux-yank",
  },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    event = "VeryLazy",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
  {
    "SmiteshP/nvim-navic",
    event = "VeryLazy",
  },
  {
    "MunifTanjim/nui.nvim",
    event = "VeryLazy",
  },
  {
    "SmiteshP/nvim-navbuddy",
    event = "VeryLazy",
    requires = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lsp = {
        auto_attach = true,
      },
    },
  },
  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    config = function() require("spectre").setup() end,
  },
  {
    "heavenshell/vim-jsdoc",
    build = "make install",
    event = { "BufEnter *.js", "BufEnter *.ts" },
  },
  {
    "stevearc/oil.nvim",
    config = function() require("oil").setup() end,
  },
  {
    "simrat39/rust-tools.nvim",
    -- config = function()
    --   local rt = require "rust-tools"
    --   local mason = require "mason-registry"
    --
    --   local codelldb = mason.get_package "codelldb"
    --   local extension_path = codelldb:get_install_path() .. "/extension/"
    --   local codelldb_path = extension_path .. "adapter/codelldb"
    --   local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
    --
    --   rt.setup {
    --     dap = {
    --       adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    --     },
    --   }
    -- end,
  },
}
