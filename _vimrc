set rtp+=$VIM/fzf-master
set rtp+=$VIM/fzf.vim-master
" (env var) FZF_DEFAULT_COMMAND = rg --files . 2> nul
" rg.exe and fzf.exe in the PATH

filetype indent plugin on
set nocompatible
syntax enable
set background=dark
colorscheme solarized8_flat
let g:netrw_banner=0
language en
set guifont=Consolas:h11:cEASTEUROPE
set noexpandtab
set tabstop=4 softtabstop=4 shiftwidth=4
set nobackup noswapfile noundofile
set wrap nolist breakindent showbreak=→
set wildmenu
set ruler
set linespace=1
set lines=999 columns=999
set hidden
winpos 0 0
set guioptions=
set cmdheight=1
set laststatus=2
set enc=utf-8
nnoremap <silent> <C-L> :noh<CR><C-L>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>t :BTags<CR>
nnoremap <silent> <leader>rg :Rg <C-R><C-W><CR>
nnoremap <C-F5> :wa<CR>:terminal make.bat run<CR>
nnoremap <F7> :wa<CR>:terminal make.bat<CR>
set showtabline=0
set complete=.,w,b,u
set cino=(0,:0,t0
set cino+=(0,W4,g0
set cino+=j1,ws,Ws "lambda
set nostartofline
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
augroup vimrc
  autocmd!
  autocmd BufRead,BufNewFile *.hlsl,*.usf,*.ush set filetype=hlsl
  autocmd BufRead,BufNewFile *.ispc set filetype=ispc
  autocmd filetype hlsl setlocal cindent
  autocmd filetype ispc setlocal cindent
  autocmd BufRead,BufNewFile *.asm,*.inc set filetype=fasm
  autocmd filetype fasm setlocal ts=12 sw=12 sts=0 smartindent nocindent noautoindent indentexpr= expandtab foldcolumn=1
augroup END
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
