" always set cursor to top of file in git commit messages
" @link https://vim.fandom.com/wiki/Always_start_on_first_line_of_git_commit_message
au BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

