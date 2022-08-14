"
" Hide cursor plugin for quickly hiding cursor
" Maintainer:   Amar Al-Zubaidi
" Version:      Vim 8 (may work with lower Vim versions, but not tested)
" URL:          https://github.com/amarakon/vim-hide-cursor
"
" Only do this when not done yet for this buffer
if exists("b:loaded_hide_cursor_plugin")
	finish
endif
let b:loaded_hide_cursor_plugin = 1

fun! s:HideCursor()
	if !exists("s:old_cursor")
		let s:old_cursor = &guicursor
	endif

	if &guicursor == "a:noCursor/lCursor"
		let &guicursor = s:old_cursor
	else
		let s:old_cursor = &guicursor
		let &guicursor="a:noCursor/lCursor"
	endif
endfunction

" Add mappings, unless the user didn't want this.
" The default mapping is registered under to <F12> by default, unless the user
" remapped it already (or a mapping exists already for <F12>)
if !exists("no_plugin_maps") && !exists("no_hide_cursor_maps")
	if !hasmapto('<SID>HideCursor()')
		noremap <F12> :call <SID>HideCursor()<CR>
		inoremap <F12> <Esc>:call <SID>HideCursor()<CR>a
	endif
endif
