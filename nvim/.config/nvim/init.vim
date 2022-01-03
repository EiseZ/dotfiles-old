""" QOL Customization
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
" Dont highlight the search when you have selected one
set nohlsearch
" Only match capitals if there is one in the search query
set smartcase

"" History
" Dont create swapfile
set noswapfile
" Make backup
set backup
" Where to put packup files
set backupdir=~/.cache/vim/backupdir
" Keep undofiles
set undofile
" Where to put undo files
set undodir=~/.cache/vim/undodir

"" IDE Features
" Show autocomplete always if there is a match, dont auto fill unless done by the user
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
" Set update time lower (less noticable delay)
set updatetime=50
" Set encoding
set encoding=utf-8
" Space for messages as bottom of screen
set cmdheight=1 " currently default
" Remove -- INSERT -- at bottom of screen (not needed because of lightline)
set noshowmode

""" Plugins
"" Plugin installs
call plug#begin('~/.vim/plugged')
    " Needed for telescope
    Plug 'nvim-lua/plenary.nvim'
    " File fuzzy finder
    Plug 'nvim-telescope/telescope.nvim'
    " Nord colorscheme
    Plug 'arcticicestudio/nord-vim'
    "" Autcomplete & Other IDE features
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Nerdtree file sidebar
    Plug 'preservim/nerdtree'
    " Icons in nerdtree
    Plug 'ryanoasis/vim-devicons'
    " Bar at bottom
    Plug 'itchyny/lightline.vim'
call plug#end()

"" Plugin settings
" Lightline
let g:lightline = { 'colorscheme': "nord" }

""" Colors
" Enable 24 bit color
set termguicolors
" Colorscheme
colorscheme nord

""" Remap
"" Settings
let mapleader = " "

"" Remap
" Use the :Format command to format
command! -nargs=0 Format :CocCommand prettier.formatFile
" Open nerdtree with ctrl + t
nnoremap <C-t> :NERDTreeToggle<CR>
" Open file searcher in telescope
nnoremap <C-space> :Telescope find_files<CR>
" Open autcompletion with ctrl space
inoremap <silent><expr> <c-space> coc#refresh()
" Complete with enter
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use tab & shift + tab to cycle completion results
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Press F2 to rename variable
nnoremap <F2> <Plug>(coc-rename)

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
augroup END5
