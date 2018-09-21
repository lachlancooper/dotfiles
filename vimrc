call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'archseer/colibri.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'fatih/vim-go'
Plug 'fatih/vim-hclfmt'
" Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
call plug#end()

set termguicolors
colorscheme colibri

set viminfo='100,s100
set backspace=indent,eol,start
set ts=4

set updatetime=500

let g:gitgutter_override_sign_column_highlight = 0
