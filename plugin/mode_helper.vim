if exists('g:loaded_mode_helper')
  finish
endif
let g:loaded_mode_helper = 1

if !exists('g:mode_helper_enabled')
  let g:mode_helper_enabled = 1
endif

if !exists('g:mode_helper_timeout')
  let g:mode_helper_timeout = 5
endif

command! ModeHelperToggle call mode_helper#toggle()

augroup ModeHelper
  autocmd!
  autocmd VimEnter * call mode_helper#update()
  autocmd ModeChanged * call mode_helper#update()
augroup END

