" Limit autocmd permissions
set secure

" Set custom colorscheme if installed
if index(getcompletion('', 'color'), 'codedark') >= 0
  " https://github.com/tomasiser/vim-code-dark#installation
  colorscheme codedark
endif

" Custom fonts in airline
let g:airline_powerline_fonts = 1

" Include vim configuration
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc
