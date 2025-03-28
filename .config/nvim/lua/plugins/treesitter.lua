return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  priority = 1000, -- Kritik öncelik
  init = function()
    -- Runtimepath düzenlemesini doğru şekilde uygula
    local ts_path = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter"
    vim.opt.runtimepath:prepend(ts_path)
  end,
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = false, -- Önce manuel kurulum yapalım
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", -- Temel parser'lar
        "javascript", "typescript", "tsx", -- JS/TS ekosistemi
        "html", "css", "json", "yaml", 
        "toml", "markdown", "python"
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = {"query"}, -- Sorunlu parser'ı devre dışı bırak
        custom_captures = {
          ["punctuation.bracket"] = "" -- JSX/TSX için önemli
        }
      },
      indent = { enable = true },
    })
  end
}
