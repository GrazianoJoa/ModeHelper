let s:popup_id = -1
let s:timer_id = -1

function! mode_helper#update()
    call mode_helper#close()

    if g:mode_helper_enabled != 1
        return
    endif

    let l:mode = mode()
    let l:lines = mode_helper#get_text(l:mode)

    let s:popup_id = popup_create(l:lines, {
        \ 'line': 1,
        \ 'col': &columns - 30,
        \ 'minwidth': 25,
        \ 'maxwidth': 40,
        \ 'padding': [0,1,0,1],
        \ 'border': [],
        \ 'highlight': 'Normal',
        \ 'zindex': 200,
        \ 'wrap': 1,
        \ })
endfunction

function! mode_helper#close()
    if s:popup_id != -1
        call popup_close(s:popup_id)
        let s:popup_id = -1
    endif
endfunction

function! mode_helper#get_text(mode)
  if a:mode ==# 'n'
    return [
          \ ' === NORMAL MODE === ',
          \ ' ',
          \ ' <NAVIGATION> ',
          \ ' h j k l -> movement',
          \ ' w / b -> start of next/previous word ',
          \ ' 0 / $ -> start/end of line ',
          \ ' gg / G -> go to file top/bottom ',
          \ ' ',
          \ ' <EDITING> ',
          \ ' dw / dd -> delete word/line ',
          \ ' yy -> yank line ',
          \ ' p / P -> paste after/before cursor ',
          \ ' u -> undo last action '
          \ ]
  elseif a:mode ==# 'i'
    return [
          \ ' INSERT MODE ',
          \ ' ------------',
          \ ' Esc    -> Normal',
          \ ' Ctrl+h -> Delete char',
          \ ' Ctrl+w -> Delete word',
          \ ' Ctrl+n -> Autocomplete'
          \ ]
  elseif a:mode ==# 'v'
    return [
          \ ' VISUAL MODE ',
          \ ' ------------',
          \ ' y -> Copy',
          \ ' d -> Delete',
          \ ' > -> Indent',
          \ ' < -> Unindent',
          \ ' Esc -> Normal'
          \ ]
  else
    return [' UNKNOWN MODE ']
  endif
endfunction

function! mode_helper#toggle()
    if g:mode_helper_enabled == 1
        let g:mode_helper_enabled = 0
        call mode_helper#close()
    else
        let g:mode_helper_enabled = 1
        call mode_helper#update()
    endif
endfunction
