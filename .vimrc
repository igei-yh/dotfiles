" 'dein' plugin manager settings
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" 'dein' installation check
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone git://github.com/Shougo/dein.vim.git' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

" 'dein' start dein settings
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " toml file settings
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

  " load toml file
  call dein#load_toml(s:toml, {'lazy': 0})

  " end dein settings
  call dein#end()
  call dein#save_state()
endif

" 'dein' install non-installed plugins
if dein#check_install()
  call dein#install()
endif

" 'dein' clean plugin {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

filetype plugin indent on

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

" highlight search result
set hlsearch

" display line numbers
set number

" process tabs according to context
set smarttab

" status line setting
set laststatus=2

" show command completion
set wildmenu

" display indent line
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_size = 1
let g:indentLine_setColors = 0

" vim go setting
let g:go_null_module_warning = 0
let g:go_fmt_command = 'gofmt'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_info_mode = 'gopls'
let g:go_def_mode = 'gopls'
let g:go_gocode_propose_source = 0
