" color scheme
syntax enable

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
set fileencodings=utf-9,iso-2022-jp,euc-jp,sjis

" use spaces instead of tabs
set expandtab

" allow other file to be displayed while changing files
set hidden

" display line numbers
set number

" process tabs according to context
set smarttab

" 'dein' plugin manager settings
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
 
if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('tomasr/molokai')
call dein#add('itchyny/lightline.vim')
call dein#add('davidhalter/jedi-vim')
call dein#add('jmcantrell/vim-virtualenv')

call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
 
