"" QOL Customization
"" Tabs
" Set tab length
set tabstop=4 softtabstop=4
set shiftwidth=4
" Auto make tab spaces
set expandtab
" Auto indent
set smartindent

"" Line numbers
" Relative number in sidebar
set relativenumber
" Show current line number instead of 0
set nu

"" Search
" Don't highlight the search when you have selected one
set nohlsearch
" Only match capitals if there is one in the search query
set smartcase

"" History
" Don't create swapfile
set noswapfile
" Make backup
set backup
" Where to put backup files
set backupdir=~/.cache/vim/backupdir
" Keep undofiles
set undofile
" Where to put undo files
set undodir=~/.cache/vim/undodir

"" IDE Features
" Show autocomplete always if there is a match, don't auto fill unless done by the user
set completeopt=menuone,noinsert,preview
" Show column in front of line numbers with symbols for errors, hints, etc.
set signcolumn=yes
" Show column on line x (to show how far you are in the text)
set colorcolumn=0 " Currently off

"" Misc
" Use vimrc of it is in directory
set exrc
" Keep non saved buffers open in the background
set hidden
" NO FING ERROR SOUND
set noerrorbells
" Start scrolling when x line away from top or bottom
set scrolloff=8
" Set update time lower (less noticeable delay)
set updatetime=50
" Set encoding
set encoding=utf-8
" Space for messages as bottom of screen
set cmdheight=1 " currently default
" Remove -- INSERT -- at bottom of screen (not needed because of lightline)
set noshowmode
" Use system clipboard instead of vim internal clipboard
set clipboard=unnamedplus

""" Plugins
"" Plugin installs
call plug#begin('~/.vim/plugged')
    " Needed for telescope
    Plug 'nvim-lua/plenary.nvim'
    " File fuzzy finder
    Plug 'nvim-telescope/telescope.nvim'
    " Filebrowser for telescope
    Plug 'nvim-telescope/telescope-file-browser.nvim'
    " Nord colorscheme
    Plug 'arcticicestudio/nord-vim'
    " Autocomplete & Other IDE features
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Nerdtree file sidebar
    Plug 'preservim/nerdtree'
    " Icons in nerdtree
    Plug 'ryanoasis/vim-devicons'
    " Bar at bottom
    Plug 'itchyny/lightline.vim'
    " Zen mode for writing
    Plug 'folke/zen-mode.nvim'
    " Glow for markdown viewing
    Plug 'ellisonleao/glow.nvim'
    " Notes system like obsidian
    Plug 'vimwiki/vimwiki'
call plug#end()

"" Plugin settings
" Telescope & telescope file browser
lua << EOF
    local telescope = require("telescope")
    telescope.setup {
        extensions = {
            file_browser = {
               hidden = true -- Show hidden files in file browser
            }
        }
    }
    require("telescope").load_extension "file_browser"
    vim.api.nvim_set_keymap( -- Use ctrl + space to open the file browser
        "n",
        "<C-space>",
        "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR> <C-h>",
        {noremap = true}
    )
EOF
" Lightline
let g:lightline = { 'colorscheme': "nord" }
" Zen-mode
lua << EOF
  require("zen-mode").setup {
    window = {
        width = 100, -- Width of x chars
        backdrop = 1, -- Make sidebars same color as main color
        options = {
            relativenumber = false, -- No numbers in zen mode
            number = false, -- Idem
        }
    },
    plugins = {
        kitty = {
            enabled = true,
            font = "+2", -- Increase font size
        },
    }
  }
EOF
" Vimwiki
let g:vimwiki_list = [ { "path": "$HOME/documents/notes/",
                        \ "syntax": "markdown", "ext": ".md" }]

""" Colors
" Enable 24 bit color
set termguicolors
" Let it work on kitty
let &t_ut=''
" Colorscheme
colorscheme nord

""" Remap
"" Settings
let mapleader = " "

"" Remap
" Use the :Format command to format
command! -nargs=0 Format :CocCommand prettier.formatFile
" Open nerdtree with ctrl + t
nnoremap <leader>t :NERDTreeToggle<CR>
" Open autocompletion with ctrl space
inoremap <silent><expr> <c-space> coc#refresh()
" Complete with enter
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use tab & shift + tab to cycle completion results
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Press F2 to rename variable
nnoremap <leader>r :%s//gc<Left><Left><Left>
" Ctrl + z for zen mode
noremap <leader>z :ZenMode<CR>
" Ctrl + m for markdown viewing
nnoremap <leader>m :Glow<CR>
" Enable spellcheking
nnoremap <leader>s :set spell! spelllang=nl_nl,en_us<CR>


"" Autocmd
augroup AUTOCMD
     autocmd!
     " Auto center screen
     autocmd InsertEnter * norm zz
     " Auto trim whitespace on save
     autocmd BufWritePre * :%s/\s\+$//e
     " Open nerdtree when vim starts
     autocmd VimEnter * NERDTree | wincmd p
     " Clone vim if nerdtree is the only windows left
     autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END4
