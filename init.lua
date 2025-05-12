
--
--  Custom colors
-----------------

vim.cmd('colorscheme csjpeter')

--
--  Home End key problem
------------------------

-- Home and End keys in normal mode
--vim.api.nvim_set_keymap('n', '<Esc>[1~', '0', { noremap = true })
--vim.api.nvim_set_keymap('n', '<Esc>[4~', '$', { noremap = true })

-- Home and End keys in insert mode
--vim.api.nvim_set_keymap('i', '<Esc>[1~', '<Esc>0i', { noremap = true })
--vim.api.nvim_set_keymap('i', '<Esc>[4~', '<Esc>$a', { noremap = true })

-- At the end I have adjusted my tmux configuration byadding these lines:
--     bind-key -n Home send Escape "OH"
--     bind-key -n End send Escape "OF"

--
--  Include config with legacy syntax
--
vim.cmd("source /home/csjpeter/.config/nvim/vimrc")

--
--  Editor backup files
-----------------------
--  Not to mess up current directory content, but use a special directory
--

vim.opt.backup = true
vim.opt.backupdir = '/home/csjpeter/tmp/nvim-backups'
vim.opt.directory = "/home/csjpeter/tmp/nvimswapfiles//"

--
--  Disable mouse support
--

--vim.opt.mouse = ""

--
--  Code autoformatting
-----------------------

vim.opt.autoindent = true
vim.opt.cindent = true
--vim.opt.cinoptions = "g0,N-s,E-s,t0,i2,(0,u0"
vim.opt.cinoptions = "(0"
vim.opt.backspace = { "indent", "eol", "start" }
vim.cmd("filetype plugin indent on")

vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.paste = false

--
--  Copilot
-----------

-- Disable default tab mapping (optional)
vim.g.copilot_no_tab_map = true

-- Map keys to accept Copilot suggestions (optional)
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

--
--  fzf and fzf.vim
-------------------

-- keymaps for fzf
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<Leader>f', ':Files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>b', ':Buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>l', ':Lines<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>h', ':History<CR>', { noremap = true })



--
--  gitsigns.nvim
-----------------

-- Set up gitsigns.nvim
require('gitsigns').setup({
  signs = {
    add = { text = '▌' },
    change = { text = '▌' },
    delete = { text = '▐' },
  },
  -- Show diff in the sign column
  signcolumn = true,
  numhl = true,
})

-- Keybinding to toggle Git blame
vim.api.nvim_set_keymap('n', '<Leader>gb', ':Gitsigns blame_line<CR>', { noremap = true })
-- Keybinding to navigate Git hunks
vim.api.nvim_set_keymap('n', '<Leader>gn', ':Gitsigns next_hunk<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gp', ':Gitsigns prev_hunk<CR>', { noremap = true })

--
-- Auto cpp header
--

--require("auto_cpp_header")

--
--  Auto make
------------

make_status = require("make_status").setup()

function get_make_status()
    if make_status then
        return make_status.status
    end
    return "notloaded"
end

--
--  Status line (needs Auto make)
---------------------------------

vim.opt.statusline = "B%03nW%02{winnr()} Line:%05l/%05L Pos:%03v(%03c)/%03{virtcol('$')-1} Chr:%03b/%02B %m %{fnamemodify(expand('%:p:h'),':h:t')}/%{fnamemodify(expand('%:p:h'),':t')}/%t %=%P make:%9{v:lua.get_make_status()}"

--
-- Folding
-----------------
--vim.cmd("syntax enable")
vim.opt.foldmethod = "marker"
--vim.opt.foldlevelstart = 2
--vim.opt.foldnestmax = 3
--vim.opt.foldcolumn = "1"
vim.opt.foldenable = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "javascript", "css" },
  callback = function()
    vim.opt_local.foldmethod = "marker"
  end,
})

