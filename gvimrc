if has("unix")
  set guifont=DejaVu\ Sans\ Mono\ 13
else
  set guifont=DejaVu_Sans_Mono:h11
end

set guioptions=ceir
set linespace=3

let g:solarized_style="dark"
colorscheme solarized

function! ToggleBackground()
  if (g:solarized_style=="dark")
    let g:solarized_style="light"
  else
    let g:solarized_style="dark"
  endif
  colorscheme solarized
endfunction
command! Togbg call ToggleBackground()
nnoremap <F12> :call ToggleBackground()<CR>
inoremap <F12> <ESC>:call ToggleBackground()<CR>a
vnoremap <F12> <ESC>:call ToggleBackground()<CR>
