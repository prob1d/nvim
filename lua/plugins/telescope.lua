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
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  keys = {
    { "<leader>ff", require("telescope.builtin").find_files, desc = "Telescope find files" },
  },
  opts = {
    extensions = {
      ["ui-select"] = { require('telescope.themes').get_dropdown() },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension('fzf')
    require("telescope").load_extension('ui-select')
  end
}
