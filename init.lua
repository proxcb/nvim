-- external "lua/plugins" plugins
require('plugins.lsp')
require('plugins.treesitter')
require('plugins.telescope')

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4        
vim.opt.shiftwidth = 4    
vim.opt.expandtab = true  
vim.opt.smartindent = true
vim.opt.autoindent = true

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


vim.pack.add({
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/Saghen/blink.cmp" },
  { src = "https://github.com/ellisonleao/gruvbox.nvim" },
})

vim.cmd[[colorscheme gruvbox]]

-- load immediately
-- require("nvim-autopairs").setup({})

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.cmd("packadd nvim-autopairs") 
    require("nvim-autopairs").setup({})
  end,
})

require("luasnip.loaders.from_vscode").lazy_load()

require("blink.cmp").setup({
	signature = { enabled = true },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
    fuzzy = {
        implementation = "lua", 
    },
})

