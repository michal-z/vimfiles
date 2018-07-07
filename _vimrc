set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

syntax enable
colorscheme solarized8_dark_flat
let g:CommandTMaxFiles=2000000
let g:CommandTTraverseSCM='dir'
let g:CommandTSCMDirectories='.git,CommandTRoot'
let g:netrw_banner=0
language en
set guifont=Consolas:h11:cEASTEUROPE
set noexpandtab
set tabstop=4 softtabstop=4 shiftwidth=4
set nobackup
set noswapfile
set noundofile
set nowrap
set wildmenu
"set wildmode=list:full
set ruler
set linespace=2
set lines=999 columns=999
winpos 0 0
set guioptions-=T " hides toolbar
set guioptions-=m " hides menu
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set cmdheight=2
set laststatus=2
set enc=utf-8
set cino=(0,:0,t0
set cino+=(0,W4,g0
unmap <C-F>
unmap! <C-F>
unmap <C-H>
unmap! <C-H>
unmap <C-Y>
unmap! <C-Y>
nnoremap <silent> <C-L> :noh<CR><C-L>
"nnoremap <F5> :wa<CR>:mak debug<CR>
nnoremap <C-F5> :wa<CR>:terminal Build.bat run<CR>
nnoremap <F7> :wa<CR>:terminal Build.bat<CR>
set showtabline=0
set wildignore=*.css,*.obj,*.iobj,*.html,*.xml,*.js,*.png,*.exe,*.dds,*.bat,*.pdb,*.dll,*.bin,*.lib,*.exp
set wildignore+=*.sln,*.csproj,*.vcproj,*.meta
" Unity
"set wildignore+=*/Library,*/ProjectSettings,*/Temp
" UE4
set wildignore+=*/UnrealEngine/Engine/Source/ThirdParty,*/UnrealEngine/Engine/Extras
set wildignore+=*/UnrealEngine/Engine/Build,*/UnrealEngine/Engine/Documentation
set wildignore+=*/Content,*/Intermediate,*/Saved,*/Binaries,*/DerivedDataCache
set wildignore+=*.uasset,*.umap
"set previewheight=16
set sidescroll=1
set sidescrolloff=10
set complete=.,w,b,u

inoremap jk <Esc>

"set rop=type:directx
"let loaded_matchparen=0

augroup vimrc
  autocmd!
  autocmd BufRead,BufNewFile *.hlsl,*.compute,*.ush,*.usf set filetype=hlsl
  autocmd BufRead,BufNewFile *.vfl set filetype=vfl
  autocmd filetype hlsl setlocal cindent
  autocmd filetype vfl setlocal cindent
augroup END
