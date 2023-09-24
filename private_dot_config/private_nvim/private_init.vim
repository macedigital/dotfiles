" Limit autocmd permissions
set secure

" Disable optional providers
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

" Include vim configuration
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc
