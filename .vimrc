" Install vim-plug if it isn't already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'sainnhe/gruvbox-material'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'joshdick/onedark.vim'
Plug 'matze/vim-move'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'alvan/vim-closetag'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/jsonc.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'liuchengxu/vista.vim'
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

call plug#end()
let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'stable', 'rls'],
      \ 'typescript': ['typescript-language-server', '--stdio']
      \ }
set cmdheight=2
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> <C-k> :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
set visualbell
set autochdir
set paste
set hidden
set rtp+=~/.fzf
"Custom Config
set showcmd
set encoding=utf-8
set fileencoding=utf-8
set number
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
exec "set listchars=tab:\uBB\uBB,nbsp:~,trail:\uB7"
set list
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
" show clock in airline
" let g:airline_section_b = '%{strftime("%H:%M")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" 
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ""
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ""
let g:airline_right_alt_sep = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
set iskeyword+=\-
"joshdick/onedark.vim
"colorscheme onedark
colorscheme gruvbox-material
let g:airline_theme = 'gruvbox_material'
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
let g:move_key_modifier = 'S'
"alvan/vim-closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.tsx'
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
" autoclose loclist when close buffer
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END
"scrooloose/nerdcommenter
let NERDDefaultAlign="left"
" mhinz/vim-startify
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
hi StartifyHeader guifg=#FFD700
"liuchengxu/vista.vim
let g:vista_default_executive = 'coc'
" Automatically install the extensions required for CoC to give us completion
" and imports.  This method is preferable to using Vim Plug because it allows
" easy updates of plugins and allows coc to uninstall them as well.
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-vimlsp']
nmap <Leader>v :Vista!!<CR>
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
noremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

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
  " Must output to /dev/tty, otherwise the escape codes don't make it out to the
  " terminal
  silent exe '!echo -ne '.shellescape(buffer).' > /dev/tty'
endfunction
command! Osc52CopyYank call Osc52Yank()
" Copy yank register to system
nnoremap <leader>y :Osc52CopyYank<cr>
" Copy selection to system clipboard
vnoremap <leader>y :<C-u>norm! gvy<cr>:Osc52CopyYank<cr>
" }}}
