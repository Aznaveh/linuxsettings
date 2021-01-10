" Vim configuration file
" C/C++ programmer; sometimes using matlab too
" Author: Aznaveh

" disable vi compatibility
set nocompatible

filetype off
syntax enable
filetype plugin on


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

Plugin 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle <CR>

Plugin 'scrooloose/syntastic'

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'
"let g:airline_solarized_bg='light'

Plugin 'airblade/vim-gitgutter'

" Color schemes
Plugin 'nelstrom/vim-mac-classic-theme'
Plugin 'altercation/vim-colors-solarized'

" Fuzzy search file
"Plugin 'kien/ctrlp.vim'

"Autocompletion
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'

"Tagbar for programming
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle <CR>

"search  match with silver searchr
"Plugin 'mileszs/ack.vim'


call vundle#end()
" path to directory where library can be found
let g:clang_library_path='/usr/local/llvm/clang-3.8/lib/libclang.so'

""""""""
" Colors
""""""""
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
set cinkeys-=0#

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

""""""""""""""""""""
" FINDING FILES:
""""""""""""""""""""
" Provides tab-completion for all file-related tasks
set path+=**

"""""""""""
" Searching
"""""""""""

set incsearch " search as characters are entered
set hlsearch " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
"searching for special characters as normal text
"command! -nargs=1 Ss let @/ = <q-args>
command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '\')



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
command! MakeTags !ctags -R .
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack


" Use visual bell instead of beeping when doing something wrong
set visualbell


""""""""""""""""""""
"" limit text width
""""""""""""""""""""
set tw=80                " automatic wrapping
"set tw=0                  " stop automatic wrapping
set colorcolumn=+1        " highlight column after 'textwidth'
"set colorcolumn=+1,+2,+3  " highlight three columns after 'textwidth'
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set colorcolumn=80

"silver searcher
let g:ackprg= 'ag --vimgrep'

"set paste "Doesnt work with snippets
set modifiable
