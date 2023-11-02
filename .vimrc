set shell=/bin/zsh

set encoding=utf-8

set mouse=a

" Syntax Highlighting
if has("syntax")
  syntax on
endif

"highlight search
set hlsearch
"line number
set nu
"auto indentation
set autoindent
set scrolloff=2
set wildmode=longest,list
set ts=4
"tag select
set sts=4
"st select
"sw : scroll width
set sw=1
"auto write the file, if user moves to other file
set autowrite
"auto read if user opens currently opened file
set autoread
"auto indent for c-language
set cindent
set bs=eol,start,indent
set history=256
"always show status bar
set laststatus=2
"set paste " 붙여넣기 계단현상 없애기
" shiftwidth : set auto indentation width
set shiftwidth=2
" showmatch : highlight matching parentheses
set showmatch
" case-aware search
set smartcase
set smarttab
set smartindent
set softtabstop=2
set tabstop=2
"show current curser
set ruler
set incsearch
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
" indents <Tab> as spaces
set expandtab

call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'Chiel92/vim-autoformat'
Plug 'chrisbra/vim-commentary'
Plug 'mhinz/vim-signify'
call plug#end()

colorscheme gruvbox
set bg=dark

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

let g:formatterpath = ['/usr/lib/llvm-10/bin']
noremap <F2> :Autoformat<CR>
noremap <F4> :NERDTreeFocus<CR>

let g:NERDTreeMinimalMenu=1

autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ exe "normal! g`\"" |
      \ endif
