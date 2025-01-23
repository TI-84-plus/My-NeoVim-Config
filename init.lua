require("plugins")

require("mason").setup{}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


require('cmp').setup{

	--snippets
	snippet = {
      		-- REQUIRED - you must specify a snippet engine
      		expand = function(args)
        	vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      		end,
    	},
	
	--sources
    	sources = {
    		{ name = 'nvim_lsp' }
  	},
}




require("mason-lspconfig").setup{ensure_installed = {
                "clangd",
	}}




local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').clangd.setup({
  cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},

  init_options = {
    fallbackFlags = { '-std=c++20' },
  },

  capabilities = capabilities,
})




require("nvim-tree").setup{}

vim.keymap.set('n', '<C-W>', ':NvimTreeToggle<CR>')


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })




vim.g.mapleader = " "

vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.cmd.colorscheme "catppuccin"

vim.opt.softtabstop = 4

vim.opt.tabstop = 4

vim.opt.shiftwidth = 4

vim.opt.number = true

vim.opt.relativenumber = true

vim.keymap.set("n", "<A-k>", "<C-u>")

vim.keymap.set("n", "<A-j>", "<C-d>")

vim.opt.number = true

vim.opt.timeoutlen = 100

vim.keymap.set("n", "<Tab>", ':bn!<CR>')

vim.keymap.set("n", "<S-Tab>", ':bp!<CR>')

vim.api.nvim_set_keymap('n', '<Leader>w', ':w!<CR>', { noremap = true})

--vim.keymap.set("n", "<C-_>", function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true })

vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)

vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)





