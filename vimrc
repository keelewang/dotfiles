set number
set cursorline
set virtualedit=block,onemore
set autoindent
set wildmenu
set completeopt-=preview
set rtp+=/opt/homebrew/opt/fzf
set background=light
colorscheme one

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
    highlight PMenu ctermfg=0 ctermbg=247 guifg=black guibg=darkgrey
    highlight PMenuSel ctermfg=247 ctermbg=8 guifg=darkgrey guibg=black
endfunction

call ToggleTheme()

autocmd FocusGained,BufEnter * call ToggleTheme()

" YCM
let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
