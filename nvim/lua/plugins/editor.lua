return {
  {
    "LazyVim/LazyVim",
    keys = {
      {
        "<leader>fya",
        function()
          local path = vim.fn.expand("%:p")
          vim.fn.setreg("+", path)
          vim.notify("Copied absolute path: " .. path, vim.log.levels.INFO)
        end,
        desc = "Copy absolute path",
      },
      {
        "<leader>fyr",
        function()
          local path = vim.fn.expand("%:~:.")
          vim.fn.setreg("+", path)
          vim.notify("Copied relative path: " .. path, vim.log.levels.INFO)
        end,
        desc = "Copy relative path",
      },
      {
        "<leader>fyf",
        function()
          local path = vim.fn.expand("%:t")
          vim.fn.setreg("+", path)
          vim.notify("Copied filename: " .. path, vim.log.levels.INFO)
        end,
        desc = "Copy filename",
      },
      {
        "<leader>fyd",
        function()
          local path = vim.fn.expand("%:p:h")
          vim.fn.setreg("+", path)
          vim.notify("Copied directory: " .. path, vim.log.levels.INFO)
        end,
        desc = "Copy directory path",
      },
    },
  },
}
