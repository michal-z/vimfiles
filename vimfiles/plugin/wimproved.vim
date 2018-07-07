" The MIT License (MIT)
"
" Copyright (c) 2015 Killian Koenig
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the \"Software\"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
if exists('g:loaded_wimproved_plugin') || &compatible
    finish
else
    let g:loaded_wimproved_plugin = 1
endif

function! s:show_wimproved_disabled()
    echo 'wimproved commands are only enabled in gVim on the Windows platform'
endfunction

if has('gui_running') && (has('win32') || has ('win64'))
    command! -nargs=? WCenter           call wimproved#set_monitor_center(<f-args>)
    command! -nargs=1 WSetAlpha         call wimproved#set_alpha(<f-args>)
    command! -nargs=0 WToggleClean      call wimproved#toggle_clean()
    command! -nargs=0 WToggleFullscreen call wimproved#toggle_fullscreen()
else
    command! -nargs=? WCenter           call s:show_wimproved_disabled()
    command! -nargs=1 WSetAlpha         call s:show_wimproved_disabled()
    command! -nargs=0 WToggleClean      call s:show_wimproved_disabled()
    command! -nargs=0 WToggleFullscreen call s:show_wimproved_disabled()
endif
