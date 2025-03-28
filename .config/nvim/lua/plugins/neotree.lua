return{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", 
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
          position = "left",
          width = 30,
        },
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true
        }
      }
    })
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle<CR>')
    vim.keymap.set('n', '<C-b>', ':Neotree filesystem close<CR>')
  end
}
