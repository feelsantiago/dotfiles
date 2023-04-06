return {
  n = {
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },
    ["J"] = { "mzJ`z", desc = "Keep cursor when J" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
    ["<leader>p"] = { [["_dp]], desc = "Paste without coping" },
    ["<leader>y"] = { [["+y]], desc = "Yank to clipboard" },
    ["<leader>Y"] = { [["+Y]], desc = "Yank to clipboard" },
    ["<leader>D"] = { [["_d]], desc = "Delete to the void" },
    ["Q"] = { "<nop>" },
    ["]b"] = false,
    ["[b"] = false,
    ["<S-C>"] = false,
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<leader>fB"] = { "<cmd>Telescope bibtex<cr>", desc = "Find BibTeX" },
    ["<leader>fe"] = { "<cmd>Telescope file_browser<cr>", desc = "File explorer" },
    ["<leader>fp"] = { function() require("telescope").extensions.projects.projects {} end, desc = "Find projects" },
    ["<leader>fR"] = { "<cmd>SymbolsOutline<CR>", desc = "Find projects" },
    ["<leader>"] = {
      ["o"] = {
        name = "Flutter"
      }
    },
    ["<leader>of"] = { "<cmd>Telescope flutter commands<CR>", desc = "Flutter" },
    ["<leader>oe"] = { "<cmd>FlutterEmulators<CR>", desc = "Flutter Emulators" },
    ["<leader>od"] = { "<cmd>FlutterDevices<CR>", desc = "Flutter Devices" },
    ["<leader>or"] = { "<cmd>FlutterReload<CR>", desc = "Flutter Reload" },
    ["<leader>oR"] = { "<cmd>FlutterRestart<CR>", desc = "Flutter Restart" },
    ["<leader>oo"] = { "<cmd>FlutterOutlineToggle<CR>", desc = "Flutter Outline" },
    ["<leader>os"] = { "<cmd>FlutterRun<CR>", desc = "Flutter Run Project" },
    ["<C-\\>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
  },
  t = {
    ["<C-BS>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
    ["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
    ["<C-\\>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move Line Down" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move Line Up" },
    ["<leader>y"] = { [["+y]], desc = "Yank to clipboard" },
    ["<leader>D"] = { [["_d]], desc = "Delete to the void" },
  }
}
