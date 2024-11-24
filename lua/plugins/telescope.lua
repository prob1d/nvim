return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  keys = function()
    local builtin = require("telescope.builtin")
    return {
      { "<leader>ff", builtin.find_files, desc = "Telescope find files" },
    }
  end,
  config = function()
    require("telescope").setup()
    require("telescope").load_extension('fzf')
  end
}
