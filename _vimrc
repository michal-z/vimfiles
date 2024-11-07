set nocompatible
colorscheme slate
syntax enable
set background=dark
language en
set guifont=Consolas:h12:cEASTEUROPE
set expandtab
set tabstop=4 softtabstop=4 shiftwidth=4
set nobackup noswapfile noundofile
set wrap nolist breakindent showbreak=→
set wildmenu
set ruler
set linespace=1
set hidden
set guioptions=
set cmdheight=1
set laststatus=2
set enc=utf-8
nnoremap <silent> <C-L> :noh<CR><C-L>
set showtabline=0
set nostartofline
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
augroup vimrc
  autocmd!
  autocmd BufRead,BufNewFile,BufEnter *.vfl set filetype=vfl cindent
  set noerrorbells visualbell t_vb=
  autocmd GUIEnter * set visualbell t_vb=
augroup END
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <Esc>:update<CR>
