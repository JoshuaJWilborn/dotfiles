" Install vim-plug if it isn't alnal on/off (neovim)
" nnoremap <A-t> :call TermToggle(12)<CR>
" inoremap <A-t> <Esc>:call TermToggle(12)<CR>
" tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>
"
" " Terminal go back to normal mode
" tnoremap <Esc> <C-\><C-n>
" tnoremap :q! <C-\><C-n>:q!<CR>meady
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'superDross/ticket.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kkoomen/vim-doge'
" colors
Plug 'sainnhe/gruvbox-material'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim/'
Plug 'fcpg/vim-orbital'
Plug 'ajmwagar/vim-deus'
" /colors
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
set viewoptions-=options
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview
set cmdheight=2
set visualbell
set hidden
set rtp+=~/.fzf
"Custom Config
set showcmd
set encoding=utf-8
set fileencoding=utf-8
set number
set relativenumber
set mouse=a
set background=dark
syntax on
set splitright
set splitbelow
set backupcopy=yes
set signcolumn=yes
set hlsearch
set directory^=$HOME/.vim/tmp//
set softtabstop=0
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set smarttab
set foldmethod=indent
set foldlevel=5
exec "set listchars=tab:\uBB\uBB,nbsp:~,trail:\uB7"
set list
set suffixesadd+=.js
set suffixesadd+=.ts
set path+=$PWD/node_modules
set autochdir
let s:default_path = escape(&path, '\ ') " store default value of 'path'

" Always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path
" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let g:ticket_auto_open = 1
let g:ticket_auto_save = 1
let g:coc_global_extensions = ["coc-prettier", "coc-tsserver", "coc-html", "coc-json"]
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" 
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ""
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ""
let g:airline_right_alt_sep = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.maxlinenr = ''
set iskeyword+=\-
"joshdick/onedark.vim
"colorscheme onedark
"colorscheme gruvbox-material

colorscheme iceberg
hi Comment guifg=#808080
" set color split line
set fillchars=vert:┃ " for vsplits
set fillchars+=fold:· " for folds
hi VertSplit guifg=#F08080
" Directory color
hi Directory guifg=#F08080
"fzf
nmap <c-p> :GFiles<CR>
"matze/vim-move
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>y Osc52Yank()
" Allows yanking even though SSH!!!
" source:
" https://github.com/fortes/dotfiles/blob/master/stowed-files/nvim/.vimrc
" copy yank buffer to system clipboard
" Use OSC52 to put things into the system clipboard, works over SSH!
function! Osc52Yank()
  let buffer=system('base64 -w0', @0)
  let buffer=substitute(buffer, "\n$", "", "")
  let buffer='\e]52;c;'.buffer.'\x07'
  " Need special escaping if within tmux
  if $TMUX != ''
    let buffer='\ePtmux;\e'.buffer.'\e\\'
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

xmap <space>f  <Plug>(coc-format)
nmap <space>f  <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocActionAsync('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocActionAsync('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
if system('uname -r') =~ "Microsoft"

  augroup Yank

    autocmd!

    autocmd TextYankPost * :call system('/mnt/c/Windows/System32/clip.exe',@")

  augroup END

endif
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <silent> <leader>z :Explore<CR>
nmap <silent> <C-w><C-w> <C-^>
let g:netrw_liststyle = 3
let g:netrw_banner = 0

highlight Normal ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight CursorColumn term=reverse ctermbg=100 guibg=#576091
highlight CursorColumn term=reverse ctermbg=100 guibg=#576091
