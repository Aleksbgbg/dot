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
noremap ; l
noremap l k
noremap k j
noremap j h

" Run clang-format when pressing =
augroup CLANG_FORMAT
  au!
  au FileType c,cpp,objc nnoremap <buffer>= :<C-u>ClangFormat<CR>
  au FileType c,cpp,objc vnoremap <buffer>= :ClangFormat<CR>
augroup END

lua require("init")
