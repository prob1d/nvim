return {
  'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
        hightlight = { enable = true },
        indent = { enable = true },
    },
}
