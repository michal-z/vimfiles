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

let mapleader=","

set scrolljump=-50
set mouse=

filetype indent plugin on
language en
set termguicolors
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
set nobackup noswapfile noundofile
set showtabline=0
set ignorecase smartcase
set wrap nolist breakindent linebreak showbreak=→

syntax on
set background=dark
colorscheme solarized8_flat

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

fun! AddMyTypes()
  syn keyword myType func i8 i16 i32 i64 u8 u16 u32 u64 f32 f64 usize ssize int32 uint32
  hi def link myType Type
  syn keyword myInclude defer
  hi def link myInclude Include
endfu

augroup vimrc
  autocmd!
  autocmd BufRead,BufNewFile,BufEnter *.usf,*.ush set filetype=cpp
  autocmd BufRead,BufNewFile,BufEnter *.cpp,*.h :call AddMyTypes()
augroup END
