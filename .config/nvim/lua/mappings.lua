require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Map Ctrl + S to save and exit insert mode when in insert mode
map("i", "<C-s>", "<cmd>w<CR><Esc>", { noremap = true, silent = true })

-- Just save in normal and visual modes
map({ "n", "v" }, "<C-s>", "<cmd>w<CR>", { noremap = true, silent = true })

-- BarBar mappings

local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- DAP
map("n", "<leader>db", "<Cmd>DapToggleBreakpoint<CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dr", "<Cmd>DapContinue<CR>", { desc = "Run or continue the debugger" })
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end)

-- Menu
map("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

-- toggle nvimtree even in terminal mode
map({ "n", "t" }, "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- override <leader>x keymap in help windows only
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    -- buffer-local map: <leader>x will now do :close
    vim.keymap.set("n", "<leader>x", "<cmd>close<CR>", { buffer = true, silent = true, desc = "Close help window" })
  end,
})

-- nvim-java
-- build & run
map("n", "<leader>wb", "<Cmd>JavaBuildBuildWorkspace<CR>", opts)
map("n", "<leader>rr", "<Cmd>JavaRunnerRunMain<CR>", opts)
map("n", "<leader>rs", "<Cmd>JavaRunnerStopMain<CR>", opts)
map("n", "<leader>rl", "<Cmd>JavaRunnerToggleLogs<CR>", opts)

-- debug
map("n", "<leader>db", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<leader>dr", "<Cmd>lua require'dap'.continue()<CR>", opts)

-- tests
map("n", "<leader>tc", "<Cmd>JavaTestRunCurrentClass<CR>", opts)
map("n", "<leader>tm", "<Cmd>JavaTestRunCurrentMethod<CR>", opts)
map("n", "<leader>td", "<Cmd>JavaTestDebugCurrentClass<CR>", opts)
