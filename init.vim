" (env var) FZF_DEFAULT_COMMAND = rg --no-config --files . 2> nul
" ripgrep (rg.exe) in PATH
call plug#begin(stdpath('data') . '/plugged')
Plug 'https://github.com/lifepillar/vim-solarized8.git'
Plug 'ziglang/zig.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

let g:fzf_history_dir = stdpath('data') . '/fzf-history'
let g:fzf_buffers_jump = 1

let g:netrw_banner=0
let mapleader=","

set scrolljump=-50
set guicursor+=a:blinkon100

filetype indent plugin on
syntax on
language en
set termguicolors
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
set nobackup noswapfile noundofile
set showtabline=0
set ignorecase smartcase
"set wrap nolist breakindent showbreak=→
colorscheme solarized8_flat
set fillchars=vert:\ 

"noremap <silent> k gk
"noremap <silent> j gj
"noremap <silent> 0 g0
"noremap <silent> $ g$

noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <Esc>:update<CR>

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>t :BTags<CR>
nnoremap <silent> <leader>rg :Rg <C-R><C-W><CR>

augroup vimrc
  autocmd!
  autocmd BufRead,BufNewFile *.hlsl set filetype=cpp
augroup END
