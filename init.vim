set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175
"terminal of nvim// much better than plugins I used
"tnoremap <Esc> <C-\><C-n>
"""""""""""""""""""""
"" Clipboard copy
    let g:clipboard = {
              \   'name': 'myClipboard',
              \   'copy': {
              \      '+': 'tmux load-buffer -',
              \      '*': 'tmux load-buffer -',
              \    },
              \   'paste': {
              \      '+': 'tmux save-buffer -',
              \      '*': 'tmux save-buffer -',
              \   },
              \   'cache_enabled': 1,
              \ }
