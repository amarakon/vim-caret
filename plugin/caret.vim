"
" Plugin for toggling the mouse or hiding the cursor
" Maintainer:   Amar Al-Zubaidi
" Version:      Vim 8 (may work with lower Vim versions, but not tested)
" URL:          https://github.com/amarakon/vim-hide-cursor
"
" Only do this when not done yet for this buffer
if exists("b:loaded_caret_plugin")
	finish
endif
let b:loaded_caret_plugin = 1

hi noCursor blend=100 cterm=strikethrough

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

fun! s:ToggleMouse()
	if !exists("s:old_mouse")
		let s:old_mouse = "a"
	endif

	if &mouse == ""
		let &mouse = s:old_mouse
		echo "Mouse is for Vim (" . &mouse . ")"
	else
		let s:old_mouse = &mouse
		let &mouse=""
		echo "Mouse is for terminal"
	endif
endfunction

" Add mappings
if !exists("no_plugin_maps") && !exists("no_caret_maps")
	if !hasmapto('<SID>HideCursor()')
		noremap <F11> <cmd>call <SID>HideCursor()<CR>
		inoremap <F11> <cmd>call <SID>HideCursor()<CR>
	endif
	if !hasmapto('<SID>ToggleMouse()')
		noremap <F12> <cmd>call <SID>ToggleMouse()<CR>
		inoremap <F12> <cmd>call <SID>ToggleMouse()<CR>
	endif
endif
