return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre", -- Load before buffer is read so signs show immediately
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 0,
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "DiffView File History" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          layout = "diff2_horizontal",
        },
        merge_tool = {
          layout = "diff3_horizontal",
        },
      },
    },
  },
}
