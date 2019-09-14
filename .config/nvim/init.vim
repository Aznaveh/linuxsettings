set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc

    set guicursor=

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


tnoremap <Esc> <C-\><C-n>
