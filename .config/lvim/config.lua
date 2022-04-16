-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "nord"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode = {
  ["<TAB>"] = ":bnext<CR>",
  ["<S-TAB>"] = ":bprevious<CR>",
  ["<C-d>"] = ":bd<CR>",
  ["<S-t>"] = ":tabnew<CR>",
}

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
vim.opt.relativenumber = true


lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.sections.lualine_b = { 'branch' }
lvim.builtin.lualine.sections.lualine_c = { '%{expand(\'%:r\')}.%{expand(\'%:e\')}' }

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true


-- Additional Plugins
lvim.plugins = {
  {
    "ray-x/lsp_signature.nvim",
  },
  { "arcticicestudio/nord-vim" }
}

require("luasnip.loaders.from_snipmate").load({ path = { "./snippets" } })

require "user.lsp_signature_cfg"
