set shell=/bin/zsh

set encoding=utf-8

set mouse=a

" Syntax Highlighting
if has("syntax")
  syntax on
endif

set hlsearch " 검색어 하이라이팅
set nu " 줄번호
set autoindent " 자동 들여쓰기
set scrolloff=2
set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 " 스크롤바 너비
set autowrite " 다른 파일로 넘어갈 때 자동 저장
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set cindent " C언어 자동 들여쓰기
set bs=eol,start,indent
set history=256
set laststatus=2 " 상태바 표시 항상
"set paste " 붙여넣기 계단현상 없애기
set shiftwidth=2 " 자동 들여쓰기 너비 설정
set showmatch " 일치하는 괄호 하이라이팅
set smartcase " 검색시 대소문자 구별
set smarttab
set smartindent
set softtabstop=2
set tabstop=2
set ruler " 현재 커서 위치 표시
set incsearch
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set expandtab                                   " indents <Tab> as spaces

call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'Chiel92/vim-autoformat'
Plug 'chrisbra/vim-commentary'
Plug 'mhinz/vim-signify'
Plug 'antiagainst/vim-tablegen'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme gruvbox
set bg=dark

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

let g:formatterpath = ['/usr/lib/llvm-10/bin']
noremap <F2> :Autoformat<CR>
noremap <F4> :NERDTreeFocus<CR>
noremap <F5> :UndotreeToggle<CR>

let NERDTreeWinPos = "left"   " NERD Tree위치 = 왼쪽
nmap  <C-f> :NERDTreeFind<CR> " Ctrl + f  NERDtree Toggle
nmap  <C-e> :NERDTreeToggle<CR> " Ctrl + e  NERDtree Toggle
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ 'Modified'  :'✹',
  \ 'Staged'    :'✚',
  \ 'Untracked' :'✭',
  \ 'Renamed'   :'➜',
  \ 'Unmerged'  :'═',
  \ 'Deleted'   :'✖',
  \ 'Dirty'     :'✗',
  \ 'Ignored'   :'☒',
  \ 'Clean'     :'✔︎',
  \ 'Unknown'   :'?',
  \ }

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

if has("persistent_undo")
  let target_path = expand('~/.undodir')

  " create the directory and any parent directories
  " if the location does not exist.
  if !isdirectory(target_path)
    call mkdir(target_path, "p", 0700)
  endif

  let &undodir=target_path
  set undofile
endif

" let g:NERDTreeMinimalMenu=1
" let g:NERDTreeHijackNetrw=1

" LLVM Makefile highlighting mode
augroup filetype
  au! BufRead,BufNewFile *Makefile*     set filetype=make
  au! BufRead,BufNewFile *.ll     set filetype=llvm
  au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ exe "normal! g`\"" |
      \ endif
