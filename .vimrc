" Vim configuration file
" C/C++ programmer; sometimes using matlab too
" Author: Aznaveh

" disable vi compatibility
set nocompatible
filetype off

"""""""""
"" Vundle
"""""""""
"for reloading use :so %
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"How to install:
"   :source %
"   :PluginInstall
"   How to clean
"   :PluginClean
" Plugins

"Plugin 'shougo/vimproc.vim'
"Plugin 'steffanc/cscopemaps.vim'
"Plugin 'matlab'
"
"Plugin 'junegunn/goyo.vim' "Distraction free writing. vim Not a fan

Plugin 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle <CR>

Plugin 'scrooloose/syntastic'

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'
"let g:airline_solarized_bg='light'

"Plugin 'godlygeek/tabular'

"Plugin 'benmills/vimux' "spliting terminal

"Plugin 'w0rp/ale'
"" Enable completion where available.
"" This setting must be set before ALE is loaded.
"let g:ale_completion_enabled = 1



" I removed it because making my vim slow
"git
"Plugin 'tpope/vim-fugitive'
" I removed it too  because making my vim slow
Plugin 'airblade/vim-gitgutter'


"Plugin 'foldutil/foldutil.vim'

" Color schemes
Plugin 'nelstrom/vim-mac-classic-theme'
Plugin 'altercation/vim-colors-solarized'

" Fuzzy search file
Plugin 'kien/ctrlp.vim'

"Autocompletion
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" I just do not like to use snippets anymore; not useful
"Plugin 'garbas/vim-snipmate'
"    "" Ultisnips
"" Track the engine.
"Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<TAB>"
"let g:UltiSnipsJumpForwardTrigger="<C-B>"
"let g:UltiSnipsJumpBackwardTrigger="<C-Z>"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"Tagbar for programming
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle <CR>

"search  match with silver searchr
Plugin 'mileszs/ack.vim'


""Plugin 'valloric/youcompleteme'
"Plugin 'rdnetto/YCM-Generator'


"Plugin 'rip-rip/clang_complete'
call vundle#end()
" path to directory where library can be found
let g:clang_library_path='/usr/local/llvm/clang-3.8/lib/libclang.so'

"Plugin 'OmniCppComplete'
""""""""
" Colors
""""""""

syntax enable

"set term=xterm-256color
let g:solarized_termcolors=256
set t_Co=256
"colorscheme elflord
"colorscheme neonwave
"colorscheme monochrome
set background=light
colorscheme solarized


"""""""""""""""
" Spaces & Tabs
"""""""""""""""

set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4 " number of spaces in tab when indenting
set expandtab " tabs are not converted to spaces
set smartindent
set autoindent
set nocscopeverbose

set backspace=indent,eol,start
"""""""""""
" UI Config
"""""""""""

set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
filetype plugin indent on " load filetype-specific indent files
""" This line cause bugs in running ctags: (I am not sure about it)
set wildmenu " visual autocomplete for command menu 
set lazyredraw " redraw only when we need to
set showmatch " highlight matching [{()}]
set mouse=a
set noerrorbells " Turning off the error bells

set laststatus=1 "only if there are at least two windows
set nobackup
set nowritebackup

"""""""""""
" Searching
"""""""""""

set incsearch " search as characters are entered
set hlsearch " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>



set wrapscan " wrap back to first search result after hitting bottom (or top) of file

"""""""""
" Folding
"""""""""

set foldenable 
set foldmethod=syntax " indent, marker, manual, expr, syntax, diff
set foldlevel=99
set foldnestmax=100
"set nofoldenable


" space open/closes folds
"nnoremap <space> za

""""""""""
" Movement
""""""""""

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" movement between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


""""""""""""
" Encryption
""""""""""""

"set cm=blowfish2 " cryptmethod

"""""""""
" Backups
"""""""""
set backup
"set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set writebackup

"""""""""
" Arabic Language just in case 
" To be done: Adding Farsi
"""""""""
"set encoding=utf-8
"set arabicshape
"set arabic


"""""""""
" tags 
"""""""""
set tags=./tags;$HOME


" Use visual bell instead of beeping when doing something wrong
set visualbell

""""""""""" limelight options
"
"let g:limelight_conceal_ctermfg = 254  " Solarized Base2
"let g:limelight_conceal_guifg = '#eee8d5'  " SolarizedBase2
""VimShell to work with my alias
"set shell=/bin/bash\ -l


""""""""""""""""""""
"" limit text width
""""""""""""""""""""
set tw=80
set colorcolumn=+1        " highlight column after 'textwidth'
"set colorcolumn=+1,+2,+3  " highlight three columns after 'textwidth'
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
"set colorcolumn=80
"
""""""""""""""""""""
"" Clipboard copy
""""""""""""""""""""
"    let g:clipboard = {
"          \   'name': 'myClipboard',
"          \   'copy': {
"          \      '+': 'tmux load-buffer -',
"          \      '*': 'tmux load-buffer -',
"          \    },
"          \   'paste': {
"          \      '+': 'tmux save-buffer -',
"          \      '*': 'tmux save-buffer -',
"          \   },
"          \   'cache_enabled': 1,
"          \ }
"
"set clipboard=unnamedplus
"set clipboard=unnamed
"nnoremap <C-y> "+y
"vnoremap <C-y> "+y
"nnoremap <C-p> "+gP   "spoil ctrlp addon
"vnoremap <C-p> "+gP

"silver searcher
let g:ackprg= 'ag --vimgrep'

"set paste "Doesnt work with snippets
