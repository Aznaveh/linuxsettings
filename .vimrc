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
"map <F2> :NERDTreeToggle <CR>

" Color schemes
"Plugin 'nelstrom/vim-mac-classic-theme'
"Plugin 'altercation/vim-colors-solarized'  "deprecated
Plugin 'lifepillar/vim-solarized8'
"let g:solarized_visibility='high'
let g:solarized_itallics=1


Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='angr'
let g:airline_solarized_bg='dark'

let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.colnr = ' ㏇:'
"let g:airline_symbols.colnr = ' ℅:'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.linenr = ' ␊:'
"let g:airline_symbols.linenr = ' ␤:'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.maxlinenr = '㏑'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = 'Ɇ'
"let g:airline_symbols.whitespace = 'Ξ'



Plugin 'airblade/vim-gitgutter'

"" Formatting: I didn't really like autoformat although it is updated recently
"let g:python3_host_prog='/usr/bin/python3'

"map <C-K> :pyf  ~/clang-format.py<cr>
"imap <C-K> <c-o>:pyf ~/clang-format.py<cr>

"Plugin 'Chiel92/vim-autoformat'  "clang-format should be installed
"This part is only for pragmas when clang_format fixed it I can take it out
Plugin 'rhysd/vim-clang-format'

let g:clang_format#style_options = {
            \ "IndentWidth" : 4,
            \ "AccessModifierOffset" : -4,
            \ "AllowShortCaseLabelsOnASingleLine": "true",
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AllowShortLoopsOnASingleLine": "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "AllowShortFunctionsOnASingleLine" : "true",
            \ "Standard" : "C++11",
            \ "IndentPPDirectives" : "BeforeHash",
            \"ConstructorInitializerAllOnOneLineOrOnePerLine": "true",
            \ "BraceWrapping": {
                \"AfterClass" : "true",
                \"AfterControlStatement" : "true",
                \"AfterEnum" : "true",
                \"AfterFunction" : "true",
                \"AfterNamespace" : "true",
                \"AfterObjCDeclaration" : "true",
                \"AfterStruct" : "true",
                \"AfterUnion" : "true",
                \"AfterExternBlock" : "true",
                \"IndentBraces" : "true"
                \},
            \ "BreakBeforeBraces" : "Allman"} 

"" A simple solution for fixing #pramgas is this, must be done in terminal 
""   # Replace "#pragma omp" by "//#pragma omp"
""   sed -i 's/#pragma omp/\/\/#pragma omp/g' ./main.c
""   # Do format
""   clang-format ./main.c
""   # Replace "// *#pragma omp" by "#pragma omp"
""   sed -i 's/\/\/ *#pragma omp/#pragma omp/g' ./main.c

""  This works only with autoformat for openmp
"command! -nargs=? -range=% -complete=filetype -bar MAutoformat
"            \ let mm_winview=winsaveview() |
"            \ <line1>,<line2>s/#pragma omp/\/\/#pragma omp/e |
"            \ <line1>,<line2>s/#pragma simd/\/\/#pragma simd/e |
"            \ <line1>,<line2> Autoformat |
"            \ <line1>,<line2>s/\/\/ *#pragma simd/#pragma simd/e |
"            \ <line1>,<line2>s/\/\/ *#pragma omp/#pragma omp/e |
"            \ call winrestview(mm_winview)
" 
"autocmd BufEnter *.c*,*.h,*.hpp exe 'vmap = :MAutoformat<CR>'
"autocmd BufEnter *.c*,*.h,*.hpp exe 'nmap =G :.,$MAutoformat<CR>'
"autocmd BufEnter *.c*,*.h,*.hpp exe 'nmap == :MAutoformat<CR>'
"autocmd BufEnter *.c*,*.h,*.hpp exe 'nmap =% :.,/}/; Autoformat<CR>'
"autocmd BufEnter *.c*,*.h,*.hpp exe 'nmap =<UP> :.-1,.MAutoformat<CR>'
"autocmd BufEnter *.c*,*.h,*.hpp exe 'nmap =<DOWN> :.,.+1MAutoformat<CR>'

" Fuzzy search file
Plugin 'kien/ctrlp.vim'

"Autocompletion
Plugin 'tabnine/YouCompleteMe' "for instlling go to .vim/bundle/YouCompleteMe
                               " python3 install.py --all
                               " to delete chmode -R 777 that folder and rm
let g:loaded_youcompleteme = 1  "uncomment not to let it load



"Tagbar for programming
"Plugin 'majutsushi/tagbar'
"nmap <F8> :TagbarToggle <CR>

"search  match with silver searchr/ Don't use it make vim SLOW
Plugin 'mileszs/ack.vim'
if executable('ag') "just use it if you have ag installed
    let g:ackprg = 'ag --nogroup --nocolor --column' 
endif


"Plugin 'rust-lang/rust.vim'

call vundle#end()
" path to directory where library can be found
"let g:clang_library_path='/usr/local/llvm/clang-3.8/lib/libclang.so'

""""""""
" Colors
""""""""
"set term=xterm-256color
set termguicolors
"colorscheme elflord
"colorscheme neonwave
"colorscheme monochrome
set background=dark
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h20
colorscheme solarized8_high
hi Normal guibg=NONE ctermbg=NONE



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
"set cinkeys-=0#
"set cinoptions+=#1s

set backspace=indent,eol,start
" underscores not counted as parts of the word
"set iskeyword-=_   " to reverse it do this :set iskeyword+=_


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
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
set nowritebackup
set guicursor=n-v-c:block,i-ci-ve:ver35,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175

"set clipboard=exclude:.* "clipboard can make startup very slow
set clipboard^=unnamed,unnamedplus
"" Clipboard copy
    let g:clipboard = {
     \   'name': 'xclip-xfce4-clipman',
     \   'copy': {
     \      '+': 'xclip -selection clipboard',
     \      '*': 'xclip -selection clipboard',
     \    },
     \   'paste': {
     \      '+': 'xclip -selection clipboard -o',
     \      '*': 'xclip -selection clipboard -o',
     \   },
     \   'cache_enabled': 1,
     \ }


"match Error /.*FIXME.*/  "custom word highlighting

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
nnoremap <Backspace> <Esc><C-W><C-h>   " getting rid of Backspace key
nnoremap <C-l> <Esc><C-W><C-l>

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
command! MakeTags !ctags -R *
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack


" Use visual bell instead of beeping when doing something wrong
set visualbell


""""""""""""""""""""
"" limit text width
""""""""""""""""""""
"set tw=80                " automatic wrapping
set tw=0                  " stop automatic wrapping
set colorcolumn=+1        " highlight column after 'textwidth'
"set colorcolumn=+1,+2,+3  " highlight three columns after 'textwidth'
"highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
highlight ColorColumn ctermbg=238
set colorcolumn=80
"wrapping only tex files
augroup WrapLineInTeXFile
    autocmd!
    autocmd FileType tex setlocal wrap
    autocmd FileType tex setlocal textwidth=80
augroup END


"set paste "Doesnt work with snippets
set modifiable

" Tweaks for browsing
"let g:netrw_banner=0        " disable annoying banner
"let g:netrw_liststyle=3     " tree view
"let g:netrw_browse_split=4  " open in prior window
"let g:netrw_altv=1          " open splits to the right
"let g:netrw_winsize = 15

"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
"""""" for terminal mode 
autocmd BufNewFile,BufRead *.inc set ft=make
"tnoremap <Esc> <C-\><C-n>
tnoremap <esc><esc> <c-w>:q!<cr>
