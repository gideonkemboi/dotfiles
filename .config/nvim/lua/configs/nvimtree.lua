local options = {
  view = {
    adaptive_size = true,
  },
  filters = {
    git_ignored = false,
  },
  renderer = {
    root_folder_label = false,
  },
}

require("nvim-tree").setup(options)
