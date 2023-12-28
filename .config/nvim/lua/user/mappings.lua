local hop = require "hop"
local directions = require("hop.hint").HintDirection

return {
  n = {
    ["<C-c>"] = { "<Esc>", desc = "Remap ctrl-c to esc" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
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
    ["<leader>fR"] = { "<cmd>SymbolsOutline<CR>", desc = "Find symbols" },
    ["<leader>ln"] = { "<cmd>Navbuddy<CR>", desc = "Symbols NavBuddy" },
    ["<leader>h"] = { "", desc = "Hop" },
    ["<leader>"] = {
      ["o"] = {
        name = "Flutter",
      },
      ["h"] = {
        name = "Hop",
      },
      ["s"] = {
        name = "Spectre",
      },
    },
    ["<leader>of"] = { "<cmd>Telescope flutter commands<CR>", desc = "Flutter" },
    ["<leader>oe"] = { "<cmd>FlutterEmulators<CR>", desc = "Flutter Emulators" },
    ["<leader>od"] = { "<cmd>FlutterDevices<CR>", desc = "Flutter Devices" },
    ["<leader>or"] = { "<cmd>FlutterReload<CR>", desc = "Flutter Reload" },
    ["<leader>oR"] = { "<cmd>FlutterRestart<CR>", desc = "Flutter Restart" },
    ["<leader>oo"] = { "<cmd>FlutterOutlineToggle<CR>", desc = "Flutter Outline" },
    ["<leader>os"] = { "<cmd>FlutterRun<CR>", desc = "Flutter Run Project" },
    ["<C-\\>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
    ["<leader>h1"] = { "<cmd>HopChar1<CR>", desc = "Hop 1 letter" },
    ["<leader>h2"] = { "<cmd>HopChar2<CR>", desc = "Hop 2 letter" },
    ["<leader>hl"] = { "<cmd>HopLine<CR>", desc = "Hop Line" },
    ["<leader>hs"] = { "<cmd>HopLineStart<CR>", desc = "Hop Line Start" },
    ["<leader>hv"] = { "<cmd>HopVertical<CR>", desc = "Hop Vertical" },
    ["<leader>hp"] = { "<cmd>HopPattern<CR>", desc = "Hop Pattern" },
    ["<leader>hw"] = { "<cmd>HopWord<CR>", desc = "Hop Word" },
    ["f"] = {
      function() hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true } end,
      desc = "Find with hop",
    },
    ["F"] = {
      function() hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true } end,
      desc = "Find with hop",
    },
    ["t"] = {
      function() hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 } end,
      desc = "Find with hop",
    },
    ["T"] = {
      function() hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 } end,
      desc = "Find with hop",
    },
    ["<leader>so"] = { function() require("spectre").open() end, desc = "Open" },
    ["<leader>sw"] = {
      function() require("spectre").open_visual { select_word = true } end,
      desc = "Select current word",
    },
    ["<leader>sp"] = {
      function() require("spectre").open_file_search { select_word = true } end,
      desc = "Select on current file",
    },
    ["<leader>lj"] = { "<cmd>JsDoc<CR>", desc = "JSDoc" },
    ["-"] = { function() require("oil").open() end, desc = "Open Parent Directory" },
  },
  t = {
    ["<C-x>"] = { [[<C-\><C-n>]], desc = "Terminal normal mode" },
    ["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
    ["<C-\\>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move Line Down" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move Line Up" },
    ["<leader>y"] = { [["+y]], desc = "Yank to clipboard" },
    ["<leader>d"] = { [["_d]], desc = "Delete to the void" },
    ["<leader>p"] = { "\"_dP", desc = "Paste witout copy" },
    ["<leader>sw"] = { function() require("spectre").open_visual() end, desc = "Select current word" },
    ["f"] = {
      function() hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true } end,
      desc = "Find with hop",
    },
    ["F"] = {
      function() hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true } end,
      desc = "Find with hop",
    },
    ["t"] = {
      function() hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 } end,
      desc = "Find with hop",
    },
    ["T"] = {
      function() hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 } end,
      desc = "Find with hop",
    },
    ["<leader>lj"] = { "<cmd>JsDoc<CR>", desc = "JSDoc" },
  },
}
