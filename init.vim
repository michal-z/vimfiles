" (env var) FZF_DEFAULT_COMMAND = rg --no-config --files . 2> nul
" ripgrep (rg.exe) in PATH
call plug#begin(stdpath('data') . '/plugged')
Plug 'ziglang/zig.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/lifepillar/vim-solarized8.git'
call plug#end()

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_history_dir = stdpath('data') . '/fzf-history'

let g:fzf_vim = {}
let g:fzf_vim.buffers_jump = 1
let g:fzf_vim.preview_window = []

let c_no_curly_error = 1

let mapleader=","

set scrolljump=-50
set mouse=

filetype indent plugin on
language en
set termguicolors
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set nobackup noswapfile noundofile
set showtabline=0
set ignorecase smartcase
set wrap nolist breakindent linebreak showbreak=→
set cino=(s,u0,j1,J1,t0
set cc=84

syntax on
set background=dark
colorscheme solarized8_flat

set fillchars=|
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

fun! AddMyTypes()
  syn keyword myType int8 uint8 int16 uint16 int32 uint32 int64 uint64
  hi def link myType Type
endfu

augroup vimrc
  autocmd!
  autocmd BufRead,BufNewFile,BufEnter *.hlsl,*.usf,*.ush set filetype=cpp
  autocmd BufRead,BufNewFile,BufEnter *.cpp,*.h :call AddMyTypes()
augroup END
