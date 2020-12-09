set rtp+=$VIM/fzf-master
set rtp+=$VIM/fzf.vim-master
let g:fzf_history_dir = '$VIM/fzf-history'
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = ''
let g:fzf_layout = {
\'window': {
\    'width': 0.9,
\    'height': 0.6,
\    'highlight': 'Identifier',
\    'border': 'sharp'
\  }
\}
" (env var) FZF_DEFAULT_COMMAND = rg --files . 2> nul
" rg.exe, fzf.exe and ctags.exe in the PATH (fzf uses ctags for :BTags)

filetype indent plugin on
set nocompatible
syntax enable
set background=dark
colorscheme solarized8_flat
let g:netrw_banner=0
language en
set guifont=Consolas:h14:cEASTEUROPE
set expandtab
set tabstop=4 softtabstop=4 shiftwidth=4
set nobackup noswapfile noundofile
set wrap nolist breakindent showbreak=→
set wildmenu
set ruler
set linespace=1
"set lines=999 columns=999
set hidden
"winpos 0 0
set guioptions=
set cmdheight=1
set laststatus=2
set enc=utf-8
nnoremap <silent> <C-L> :noh<CR><C-L>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>t :BTags<CR>
nnoremap <silent> <leader>rg :Rg <C-R><C-W><CR>
set showtabline=0
set complete=.,w,b,u
"set cino=(0,:0,t0
"set cino+=(0,W4,g0
set cino+=j1,ws,Ws "lambda
set cino+=(s,m1,u0,N-s
set nostartofline
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
augroup vimrc
  autocmd!
  autocmd BufRead,BufNewFile *.hlsl,*.ixx,*.usf,*.ush set filetype=cpp
  set noerrorbells visualbell t_vb=
  autocmd GUIEnter * set visualbell t_vb=
augroup END
command Bd bp | sp | bn | bd
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <Esc>:update<CR>
set exrc " Enable support for per-project .vimrc file.
set secure
