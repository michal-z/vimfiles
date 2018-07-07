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
if exists('g:loaded_wimproved') || &compatible
    finish
else
    let g:loaded_wimproved = 1
endif

let s:arch = has('win64') ? '64' : '32'
let s:dll_path = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/../wimproved' . s:arch . '.dll'

let s:repository = 'https://github.com/kkoenig/wimproved.vim'
let s:unexpected_error = 'Please report @ ' . s:repository
let s:missing_dll_error = 'See ' . s:repository . ' for setup instructions'

function! s:get_background_color() abort
    let l:s = synIDattr(hlID('Normal'), 'bg#')
    if !len(l:s)
        return 0xFFFFFF
    endif

    return str2nr(strpart(l:s, 1), 16) " Skip over the #
endfunction

let s:gui_options_override = 0
let s:gui_options_cache = ''
function! s:set_allow_gui(allow_gui) abort
    let l:columns = &columns
    let l:lines = &lines
    if !a:allow_gui
        if !s:gui_options_override
            let s:gui_options_cache=&guioptions

            " Hide menu bar, tool bar, all scroll bars
            set guioptions-=e
            set guioptions-=m
            set guioptions-=T
            set guioptions-=l
            set guioptions-=L
            set guioptions-=r
            set guioptions-=R
            let s:gui_options_override = 1
        endif
    else 
        if s:gui_options_override
            let &guioptions=s:gui_options_cache
            let s:gui_options_override = 0
        endif
    endif
    let &columns=l:columns
    let &lines=l:lines
endfunction

let s:default_window_brush = -1
function! s:set_window_clean(is_clean) abort
    if a:is_clean
        let old_brush = libcallnr(s:dll_path, 'set_window_style_clean', s:get_background_color())
        if s:default_window_brush != -1
            let s:default_windoww_brush = old_brush
        endif
    else
        call libcallnr(s:dll_path, 'set_window_style_default', s:default_window_brush)
    endif
endfunction

function! s:set_fullscreen(is_fullscreen) abort
    if a:is_fullscreen
        let old_brush = libcallnr(s:dll_path, 'set_fullscreen_on', s:get_background_color())
        if s:default_window_brush != -1
            let s:default_windoww_brush = old_brush
        endif
    else
        call libcallnr(s:dll_path, 'set_fullscreen_off', s:default_window_brush)
    endif
endfunction

function! s:fix_window_brush_color() abort
    try
        if s:fullscreen_on || s:clean_window_style_on
            call libcallnr(s:dll_path, 'update_window_brush', s:get_background_color())
        endif
    catch /^Vim\%((\a\+)\)\=:E364/
        echom 'Could not locate ' . s:dll_path
        echom s:missing_dll_error
    catch
        echom v:exception
        echom s:unexpected_error
    endtry
endfunction

function! wimproved#set_alpha(alpha) abort
    try
        call libcallnr(s:dll_path, 'set_alpha', str2nr(a:alpha))
    catch /^Vim\%((\a\+)\)\=:E364/
        echom 'Could not locate ' . s:dll_path
        echom s:missing_dll_error
    catch
        echom v:exception
        echom s:unexpected_error
    endtry
endfunction

function! wimproved#set_monitor_center(...) abort
    try
        if !s:fullscreen_on
            let v = len(a:000) ? str2nr(a:1) : 0
            call libcallnr(s:dll_path, 'set_monitor_center', v)
        endif
    catch /^Vim\%((\a\+)\)\=:E364/
        echom 'Could not locate ' . s:dll_path
        echom s:missing_dll_error
    catch
        echom v:exception
        echom s:unexpected_error
    endtry
endfunction

let s:clean_window_style_on = 0
function! wimproved#toggle_clean() abort
    try
    " If we are fullscreen don't update our style, but remember it for later
        if s:fullscreen_on
            let s:clean_window_style_on = !s:clean_window_style_on
            return
        endif

        " When switching to clean, we need to remove the gui and force a
        " redraw before updating the window style to avoid visual glitches
        if !s:clean_window_style_on
            call s:set_allow_gui(0)
        endif

        call s:set_window_clean(!s:clean_window_style_on)

        " When switching to default, restore guioptions to its original state
        " We can afford to let the redraw happen naturally
        if s:clean_window_style_on
            call s:set_allow_gui(1)
        endif

        let s:clean_window_style_on = !s:clean_window_style_on
    catch /^Vim\%((\a\+)\)\=:E364/
        echom 'Could not locate ' . s:dll_path
        echom s:missing_dll_error
    catch
        echom v:exception
        echom s:unexpected_error
    endtry
endfunction

let s:fullscreen_on = 0
function! wimproved#toggle_fullscreen() abort
    try
        if !s:fullscreen_on
            call s:set_allow_gui(0)
        endif

        call s:set_fullscreen(!s:fullscreen_on)

        " Changing fullscreen state clobbers window style so refresh clean state
        if s:fullscreen_on
            call s:set_window_clean(s:clean_window_style_on)
            call s:set_allow_gui(!s:clean_window_style_on)
        endif

        let s:fullscreen_on = !s:fullscreen_on
    catch /^Vim\%((\a\+)\)\=:E364/
        echom 'Could not locate ' . s:dll_path
        echom s:missing_dll_error
    catch
        echom v:exception
        echom s:unexpected_error
    endtry
endfunction

autocmd ColorScheme * call s:fix_window_brush_color()
