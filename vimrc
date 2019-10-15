call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'archseer/colibri.vim'
Plug 'dense-analysis/ale'
Plug 'farmergreg/vim-lastplace'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
" Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
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
let g:terraform_fmt_on_save = 1

" ALE
let g:ale_linters_explicit = 1
let g:ale_linters = {
\  'sh': ['shellcheck'],
\  'yaml': ['yamllint'],
\}

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
