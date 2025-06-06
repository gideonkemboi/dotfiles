-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

-- 1. override vim.notify to use nvim-notify
vim.notify = require "notify"

-- 2. configure nvim-notify
require("notify").setup {
  top_down = true,
}

M.base46 = {
  theme = "tokyodark",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

return M
