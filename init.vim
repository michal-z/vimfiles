" (env var) FZF_DEFAULT_COMMAND = rg --no-config --files . 2> nul
" ripgrep (rg.exe) in PATH
call plug#begin(stdpath('data') . '/plugged')
Plug 'ziglang/zig.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/lifepillar/vim-solarized8.git'
call plug#end()

let g:fzf_history_dir = stdpath('data') . '/fzf-history'
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = []

let mapleader=","

set scrolljump=-50

filetype indent plugin on
language en
set termguicolors
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
set nobackup noswapfile noundofile
set showtabline=0
set ignorecase smartcase
set wrap nolist breakindent showbreak=→

syntax on
set background=dark
colorscheme solarized8_flat
:hi! MatchParen guifg=Red guibg=NONE
:hi! StatusLine gui=NONE guifg=#eee8d5 guibg=#073642
:hi! StatusLineNC gui=NONE guifg=#93a1a1 guibg=#073642

set fillchars=vert:\ 
set isfname-=:
set exrc
set secure

noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

noremap <C-S> :wall<CR>
vnoremap <C-S> <C-C>:wall<CR>
inoremap <C-S> <Esc>:wall<CR>

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>t :BTags<CR>
nnoremap <silent> <leader>rg :Rg <C-R><C-W><CR>

"augroup vimrc
"  autocmd!
"  autocmd BufRead,BufNewFile *.hlsl setf cpp
"augroup END
