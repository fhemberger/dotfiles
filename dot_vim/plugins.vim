"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug-ins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
  Plug 'editorconfig/editorconfig-vim'

  Plug 'itchyny/lightline.vim'
  set laststatus=2
  set showtabline=1
  set noshowmode
  let g:lightline = {'colorscheme' : 'sonokai'}

  Plug 'junegunn/vim-easy-align'
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
  " Aligning by " needs a little work:
  " :%EasyAlign /"/

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " iA Writer like distraction free Markdown editing
  Plug 'junegunn/goyo.vim'
  Plug 'amix/vim-zenroom2'

  " Plug 'liuchengxu/vim-which-key'
  " let g:mapleader = "\<Space>"
  " let g:maplocalleader = ','
  " nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
  " nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

  Plug 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_enable_on_vim_startup=1
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=238
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236

  " Filtering search results according to .gitignore in your project, and the global ~/.gitignore.
  Plug 'octref/RootIgnore'

  Plug 'sainnhe/sonokai'
  if has('termguicolors')
    set termguicolors
  endif

  " The configuration options should be placed before `colorscheme sonokai`.
  let g:sonokai_style = 'shusia'
  let g:sonokai_enable_italic = 1
  let g:sonokai_disable_italic_comment = 1
  :silent! colorscheme sonokai
  hi! Normal ctermbg=NONE guibg=NONE
  hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

  " Plug 'terryma/vim-multiple-cursors'
  " let g:multi_cursor_use_default_mapping=0
  " Default mapping
  " let g:multi_cursor_start_word_key      = '<C-s>'
  " let g:multi_cursor_select_all_word_key = '<A-s>'
  " let g:multi_cursor_start_key           = 'g<C-s>'
  " let g:multi_cursor_select_all_key      = 'g<A-s>'
  " let g:multi_cursor_next_key            = '<C-s>'
  " let g:multi_cursor_prev_key            = '<C-p>'
  " let g:multi_cursor_skip_key            = '<C-x>'
  " let g:multi_cursor_quit_key            = '<Esc>'
call plug#end()
