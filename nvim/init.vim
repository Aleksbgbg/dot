" Hybrid line numbers
set number relativenumber
set nu rnu

" Cursor
set scrolloff=999 " Vertically center
set cursorline " Highlight

" Tabs -> spaces
filetype plugin indent on " Use indentation based on file type
set list " Show tabs visually
set expandtab " Insert spaces when pressing <Tab>
set tabstop=2 " Insert 2 spaces when pressing <Tab>
set shiftwidth=2 " Replace tabs with 2 spaces

" Lowercase search is case insensitive
set ignorecase " Note that this applies to substitutions as well
set smartcase

" Remap hjkl to home row
nnoremap ; l
nnoremap l k
nnoremap k j
nnoremap j h

lua require("init")
