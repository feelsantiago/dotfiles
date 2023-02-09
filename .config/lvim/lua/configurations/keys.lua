lvim.leader = "space"

lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"

lvim.keys.normal_mode["J"] = "mzJ`z"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-r>"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"

-- Paste without coping
lvim.keys.visual_block_mode["<leader>p"] = [["_dp]]

-- Yank to clipboard
lvim.keys.visual_mode["<leader>y"] = [["+y]]
lvim.keys.normal_mode["<leader>y"] = [["+y]]
lvim.keys.normal_mode["<leader>Y"] = [["+y]]

-- Delete to the void
lvim.keys.visual_mode["<leader>D"] = [["_d]]
lvim.keys.normal_mode["<leader>D"] = [["_d]]

lvim.keys.normal_mode["Q"] = "<nop>"

-- Quick Fix Navigation
lvim.keys.normal_mode["<leader>k"] = "<cmd>lnext<CR>zz"
lvim.keys.normal_mode["<leader>j"] = "<cmd>lprev<CR>zz"

-- Code actions
lvim.keys.normal_mode["M-CR"] = ":lua vim.lsp.buf.code_action()<CR>"

-- Terminal
lvim.keys.term_mode["<esc>"] = [[<C-\><C-n>]]
-- Spellchecker
lvim.builtin.which_key.mappings["z"] = {
    name = "Spellchecker",
    t = { ":set spell!<CR>", "Toggle Spellchecker" },
    f = { "z=", "Fix" },
    a = { "zg", "Add to dictionary" },
}

-- Replace current word
lvim.builtin.which_key.mappings["r"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace Word" }

lvim.builtin.which_key.mappings["R"] = {
    name = "Search & Replace",
    s = { "<cmd>lua require('spectre').open()<CR>", "Search" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search Word" }
}

lvim.builtin.which_key.mappings["p"] = {
    name = "Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
    s = { "<cmd>SymbolsOutline<CR>", "symbols" },
}

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
    -- for input mode
    i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
    },
    -- for normal mode
    n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
    },
}

local _, builtin = pcall(require, "telescope.builtin")
lvim.builtin.which_key.mappings["?"] = { builtin.oldfiles, "Recent files" }

lvim.builtin.which_key.mappings["t"] = {
    name = "Telescope",
    f = { "<cmd>Telescope flutter commands<CR>", "Flutter" }
}
