"
" Maintainer:	Dylan <dylan@haitu.io>
" Last change:	2024/11/03
"
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
    background: blue;
endif

call plug#begin()
    Plug 'ayu-theme/ayu-vim'
    Plug 'https://github.com/vim-plugins/ctags.git'
    Plug 'https://github.com/vim-plugins/taglist.git'
    Plug 'https://github.com/vim-plugins/nerdtree.git'
    Plug 'https://github.com/bling/vim-airline.git'
call plug#end()

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Tells Vim to look for a tags file in the directory of the current file, 
" in the current directory and up and up until your $HOME.
set tags=./tags,tags;$HOME

syntax on
filetype off

" set background=dark
" colorscheme desert
set termguicolors
let ayucolor="mirage"
colorscheme ayu

set nobackup	" do not keep a backup file, use versions instead
set history=50  " keep 50 lines of command line history
set ruler	" show the cursor position all the time
set showcmd	" display incomplete commands
set incsearch	" do incremental searching
set title
set nu
set autoindent
set smartindent
set cindent
set tabstop=4
set shiftwidth=4
set showmatch
set incsearch
set list lcs=tab:\¦\ 

let Tlist_Show_One_Flie=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=60

map <F1> :NERDTreeToggle<CR>
map <F2> :Tlist<CR>

let mapleader = ","
nnoremap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

filetype plugin indent on

" Markdown
"
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

" ctrlp
"
let g:ctrlp_map = '<c-p>'

" Plugin key-mappings.
"
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:ackprg = 'ag --nogroup --nocolor --column'
