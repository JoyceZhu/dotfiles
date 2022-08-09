" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Workaround for https://github.com/vim/vim/issues/3117
if has('python3')
  silent! python3 1
endif

"No security issues
set modelines=0

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set t_Co=256

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set colorcolumn=73,81
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
map <SPACE> <leader>

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

set hlsearch

syntax enable             " Turn on syntax highlighting
" Linewrap git commits
au FileType gitcommit set tw=72

" Only do this part when compiled with support for autocommands.
"if has("autocmd")

  "" Enable file type detection.
  "" Use the default filetype settings, so that mail gets 'tw' set to 72,
  "" 'cindent' is on in C files, etc.
  "" Also load indent files, to automatically do language-dependent indenting.
  "filetype on
  "filetype off
  "filetype plugin indent on
  "filetype plugin on

  "" Put these in an autocmd group, so that we can delete them easily.
  "augroup vimrcEx
  "au!

  "" For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

  "" When editing a file, always jump to the last known cursor position.
  "" Don't do it when the position is invalid or when inside an event handler
  "" (happens when dropping a file on gvim).
  "" Also don't do it when the mark is in the first line, that is the default
  "" position when opening a file.
  "autocmd BufReadPost *
    "\ if line("'\"") > 1 && line("'\"") <= line("$") |
    "\   exe "normal! g`\"" |
    "\ endif

  "augroup END

"else

"set autoindent		" always set autoindenting on

"endif " has("autocmd")
set autoindent
filetype on
filetype off
filetype plugin indent on
filetype plugin on

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis

endif

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set showmatch
" Relative line numbers in normal mode, absolute in insert
set number relativenumber
":augroup numbertoggle
":  autocmd!
":  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
":  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup ENDet cursorline
" Copy and paste to system clipboard
"set clipboard^=unnamed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
  Plug 'agude/vim-eldar'
  Plug 'scrooloose/nerdtree'
  Plug 'pangloss/vim-javascript'
  Plug 'machakann/vim-sandwich'
  Plug 'w0rp/ale'
  Plug 'junegunn/fzf.vim'
  Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'tpope/vim-fugitive'
  "Plug 'heavenshell/vim-jsdoc'
  Plug 'maximbaz/lightline-ale'
  "" Block till vim issue resolved
  ""Plug 'Valloric/YouCompleteMe'
  Plug 'itchyny/lightline.vim'
  ""Plug 'euclio/vim-nocturne'
  ""Plug 'airblade/vim-gitgutter'
  Plug 'ap/vim-css-color'
  "Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-commentary'
  Plug 'frazrepo/vim-rainbow'
call plug#end()
set updatetime=100
let g:eldar_green = "#06eb78"
silent! colorscheme eldar " Custom color scheme
map <leader>fs :NERDTreeToggle<cr>
let g:rainbow_active = 1

" ALE

"let g:ale_fixers = {
"\   'javascript': ['prettier', 'eslint'],
"\   'less': ['prettier'],
"\}
"let g:ale_linters = {
"\   'python': ['mypy', 'flake8', 'pylint'],
"\}
"let g:ale_linters_ignore = {
"\    'python': ['pylint'],
"\}
"let g:ale_fix_on_save = 1
"let g:javascript_eslint_executable = "node_modules/eslint/bin/eslint.js"
"let g:javascript_eslint_options = "--config=static/tools/eslint/eslintrc.js --rulesdir=static/tools/eslint/r:ules --ext=.jsx,.js --rule 'no-debugger: 0'"
"let g:ale_javascript_prettier_executable = "node_modules/.bin/prettier"
"let g:ale_python_flake8_options='--ignore=F841,F401,E129,E128,E127,E125,E228,N802,N806 --max-line-length=8000 --builtins=run,finish,write_task'
"let g:ale_python_mypy_executable="~/local/bin/mypy-wrapper.sh"
"let g:ale_python_mypy_ignore_invalid_syntax=1

set laststatus=2
set noshowmode
let s:utf = &enc ==# 'utf-8' && &fenc ==# 'utf-8'

" Lightline
"
"
let g:lightline = extend(get(g:, 'lightline', {}), {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex'], ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'] ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ],
      \   'right': []
      \ },
      \ 'tab': {
      \   'active': [ 'tabnum', 'readonly', 'modified' ],
      \   'inactive': [ 'tabnum', 'readonly', 'modified' ]
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2c',
      \   'charvaluehex': '0x%B',
      \ },
     \ 'component_expand': {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ 'component_type' : {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ },
      \ }, 'keep')

if s:utf
  call extend(g:lightline, {
      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" } })
endif
let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }
"set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
let g:javascript_plugin_jsdoc = 1
" Quickly jump to the definition of a symbol (smarter than ctags) "
"map <leader>f :call FindDefinition()<cr>
" grr for word under cursor "
"map <leader>m :Grr <cword> -m 1000<cr>
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['<', '>'], ['{', '}']]
highlight LineNr term=bold cterm=NONE ctermfg=Red

" unmap gc
" nunmap gcc
" nunmap gcu

xmap <leader>c  <Plug>Commentary
nmap <leader>c  <Plug>Commentary
omap <leader>c  <Plug>Commentary
nmap <leader>cc <Plug>CommentaryLine
nmap l<leader>c <Plug>ChangeCommentary
nmap <leader>cu <Plug>Commentary<Plug>Commentary
