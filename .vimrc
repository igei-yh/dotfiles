" 'dein' plugin manager settings
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git://github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('tomasr/molokai')
call dein#add('itchyny/lightline.vim')
call dein#add('Yggdroot/indentLine')
call dein#add('scrooloose/syntastic')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('davidhalter/jedi-vim')
call dein#add('jmcantrell/vim-virtualenv')
call dein#add('hashivim/vim-terraform')
call dein#add('cohama/lexima.vim')
call dein#add('elzr/vim-json')

call dein#end()
filetype plugin indent on

" 'dein' install non-installed plugins
if dein#check_install()
  call dein#install()
endif

" color scheme
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
let g:lightline = {
  \ 'colorscheme': 'molokai'
  \}

" json syntax config
let g:vim_json_syntax_conceal = 0

syntax on

" auto indent settings
set autoindent

" autoread when file is modified externally
set autoread

" backspace range setting
set backspace=indent,eol,start

" share clipboard with os
set clipboard=unnamed,autoselect

" confirm saving before closing file
set confirm

" collaborative display of cursor lines
set cursorline

set encoding=utf8
scriptencoding utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

" use spaces instead of tabs
set expandtab

" allow other file to be displayed while changing files
set hidden

" display line numbers
set number

" process tabs according to context
set smarttab

" status line setting
set laststatus=2

" display indent line
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_size = 1
let g:indentLine_setColors = 0
