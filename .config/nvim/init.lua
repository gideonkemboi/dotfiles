vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

require("dap-python").setup "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"

-- Function to set filetype based on a pattern
local function set_filetype(pattern, filetype)
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = pattern,
    command = "set filetype=" .. filetype,
  })
end

-- Set the filetype to 'yaml.docker-compose' for docker-compose files
set_filetype({ "docker-compose.yml", "docker-compose.yaml" }, "yaml.docker-compose")

-- Tailwind Classes sort on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.html", "*.jsx", "*.tsx", "*.css", "*.vue", "*.svelte" },
  callback = function(ctx)
    -- 1. Find the nearest package.json upward from the current file
    local pkgpath = vim.fs.find("package.json", { path = vim.fs.dirname(ctx.file), upward = true })[1]
    if not pkgpath then
      return
    end

    -- 2. Read & decode package.json
    local lines = vim.fn.readfile(pkgpath)
    local ok, pkg = pcall(vim.fn.json_decode, table.concat(lines, "\n"))
    if not ok or type(pkg) ~= "table" then
      return
    end

    -- 3. Merge deps & devDeps, bail if tailwindcss not found
    local deps = vim.tbl_extend("force", pkg.dependencies or {}, pkg.devDependencies or {})
    if not deps["tailwindcss"] then
      return
    end

    -- 4. We’re in a Tailwind project—run the sort
    vim.cmd "TailwindSort"
  end,
})
