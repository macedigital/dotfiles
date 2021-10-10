" ideas stolen from https://www.youtube.com/watch?v=Gs1VDYnS-Ac
setlocal colorcolumn=80

setlocal path=.,**
setlocal wildignore=*.pyc

setlocal include=^\\s*import
setlocal define=^\\s*\\<\\(def\\\|class\\)\\>

