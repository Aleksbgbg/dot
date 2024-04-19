" Hybrid line numbers
set number relativenumber
set nu rnu

" Tabs -> spaces
filetype plugin indent on " Use indentation based on file type
set list " Show tabs visually
set expandtab " Insert spaces when pressing <Tab>
set tabstop=2 " Insert 2 spaces when pressing <Tab>
set shiftwidth=2 " Replace tabs with 2 spaces

" Lowercase search is case insensitive
set ignorecase " Note that this applies to substitutions as well
set smartcase

lua require("init")
