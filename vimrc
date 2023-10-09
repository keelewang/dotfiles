set number
set cursorline
set virtualedit=block,onemore
set autoindent
set wildmenu
set completeopt-=preview
set rtp+=/opt/homebrew/opt/fzf
colorscheme one
set background=light

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" Auto switch theme
function! ToggleTheme()
  let os_theme = system('defaults read -g AppleInterfaceStyle')
  if os_theme == "Dark\n"
    set background=dark
  else
    set background=light
  endif
endfunction

call ToggleTheme()
autocmd FocusGained,BufEnter * call ToggleTheme()
