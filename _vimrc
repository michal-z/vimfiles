set rtp+=$VIM/fzf-master
set rtp+=$VIM/fzf.vim-master
let g:fzf_history_dir = '$VIM/fzf-history'
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = ''
let g:fzf_layout = {
\ 'window': {
\     'width': 0.9,
\     'height': 0.6,
\     'highlight': 'Identifier',
\     'border': 'sharp'
\   }
\ }
" (env var) FZF_DEFAULT_COMMAND = rg --no-config --files . 2> nul
" (env var) RIPGREP_CONFIG_PATH = C:\Development\vim\.ripgreprc
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
set hidden
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
set cino=j1,ws,Ws,(s,u0,g0,:0
set nostartofline
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
fun! AddMyTypes()
	syn keyword myType int8 int16 int32 int64 uint8 uint16 uint32 uint64
	hi def link myType Type
endfu
augroup vimrc
  autocmd!
  autocmd BufRead,BufNewFile,BufEnter *.hlsl,*.ixx,*.usf,*.ush set filetype=cpp
  autocmd BufRead,BufNewFile,BufEnter *.cpp,*.h :call AddMyTypes()
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
set exrc
set secure
nmap ,d :b#<bar>bd#<CR>
nmap ,D :bd<CR>
set isfname-=:
