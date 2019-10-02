call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
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
call plug#end()kkj

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'typescript': ['typescript-language-server', '--stdio']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> <C-k> :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>



set rtp+=~/.fzf
"Custom Config
set encoding=utf-8
set fileencoding=utf-8
set number
set mouse=a
syntax on
set splitright
set splitbelow
set backupcopy=yes
set signcolumn=yes
set hlsearch
set directory^=$HOME/.vim/tmp//
" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"used for autocomplete when adding dash
set iskeyword+=\-

"joshdick/onedark.vim
colorscheme onedark
hi Comment guifg=#808080

" set color split line
set fillchars=vert:┃ " for vsplits
set fillchars+=fold:· " for folds
hi VertSplit guifg=#F08080
" Directory color
hi Directory guifg=#F08080

"scrooloose/nerdtree
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" open close icon
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
nmap <Leader>n :NERDTreeToggle<CR>

"fzf
nmap <c-p> :FZF<CR>

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

let g:startify_custom_header=[
      \ ' *********************************************************************///((((##((((((((////////****, ',
      \ ' *****.,,,..***********************************************************///(((((((((((//////////***** ',
      \ ' ******.,,,,.%%./////**************************************************/////(((((//////////////***** ',
      \ ' *****...,,,.%%%%%%.///**************************************************///////////////////////**** ',
      \ ' ********.,,.%%%%%%%%%/.************************************************************************..,, ',
      \ ' ****/////*,.%%%%%%%%%%%%%.*********************************************,,,,,,,,,,,,,,,,,,.*%%%%%.,, ',
      \ ' ***////////,%%%%%%%%%%%%%%%%.******************************************,,,,,,,,,,,,,.#%%%%%%%%%%.,, ',
      \ ' ***/////////.%%%%%%%%%%%%%%%%%%.****************************************,,,,,,,.,%%%%%%%%%%%%%%%,,, ',
      \ ' **//////////*.%%%%%%%%%%%%%%%%%%%%**************************************,,,.%%%%%%%%%%%%%%%%%%%.,., ',
      \ ' */////////****.%%%%%%%%%%%%%%%%%%%%%.**********************************.%%%%%%%%%%%%%%%%%%%%%%%,.,, ',
      \ ' */////////*****.%%%%%%%%%%%%%%%%%%%%%%,*************,........,*****.%%%%%%%%%%%%%%%%%%%%%%%%%%.,,,, ',
      \ ' /////////*****,,,%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.,,,,, ',
      \ ' /////////****,,,,,.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%,*,,,,, ',
      \ ' *************,,,,,,,(%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.*******, ',
      \ ' *********,,,,,,,,,,,,,%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//////***** ',
      \ ' ,,,,,,,,,,,,,,,,,,,,,,,,#%%.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.////////**** ',
      \ ' ,,,,,,,,,,,,,,,,,,,,,,,,,.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.%%%%./////////***** ',
      \ ' ,,,,,,,,,,,,,,,,,,,,,,,,,%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%,***////////****** ',
      \ ' ,,,,...,,,,,,,,,,,,,,,,,%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.***************, ',
      \ ' .........,,,,,,,,,,,,,,(%%%%%%%%%%*%,,.%%%%%%%%%%%%%%%%%%%%%%%%%*%,,.%%%%%%%%%%%%%%.**************, ',
      \ ' .........,,,,,,,,,,***.%%%%%%%%%%,&@%,,.%%%%%%%%%%%%%%%%%%%%%%%,&@%,,.%%%%%%%%%%%%%%*************,, ',
      \ ' ..........,,,,,,,,***,%%%%%%%%%%%.,,,,,.%%%%%%%%%%%%%%%%%%%%%%%.,,,,,.%%%%%%%%%%%%%%.**********,,,, ',
      \ ' ..........,,,,,,,,***#%%%%%%%%%%%%.,,,.%%%%%%%%%%%%%%%%%%%%%%%%%.,,,.%%%%%%%%%%%%%%%%,,,,,,,,,,,,,, ',
      \ ' ...........,,,,,,,**.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.,,,,,,,,,,,,, ',
      \ ' ..........,,,,,,,***%%%%%%%%%%%%%%%%%%%%%%%%%%%.,,,%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.,,,,,,,,,,,, ',
      \ ' .........,,,,,,,***.%%%//////(%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%(///////%%%%%%%#,,,,,,,,,,,, ',
      \ ' ,,,,,,,,,,,,,,*****,%//////////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//////////(%%%%%%.********,,, ',
      \ ' ,,,,,,,,,**********%%//////////%%%%%%%%%%%%%%%%%%%###%%%%%%%%%%%%%%%%////////////%%%%%%%**********, ',
      \ ' *******************%%%////////%%%%%%%%%%%%%%%(,#########*%%%%%%%%%%%%%//////////%%%%%%%%.*********, ',
      \ ' ***********////////*%%%%%%%%%%%%%%%%%%%%%%%%%,##########,%%%%%%%%%%%%%%%//////%%%%%%%%%%#///******* ',
      \ ' ///////////////////*%%%%%%%%%%%%%%%%%%%%%%%%%,##########(%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.////***** ',
      \ ' ////////////////////.%%%%%%%%%%%%%%%%%%%%%%%%%,/########,%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%,/////**** ',
      \ ' /////////////////////.%%%%%%%%%%%%%%%%%%%%%%%%%%%%,,,,%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%/////**** ',
      \ ' /////////////////////*.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.///***** ',
      \ ' ////////////////////***.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%(//*****, ',
      \ ' **////////////////******.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*******, ',
      \ ' ************************.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.*****,, ',
      \ ' ************************(%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.****,,, ',
      \ ]

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
hi StartifyHeader guifg=#FFD700

"liuchengxu/vista.vim
let g:vista_default_executive = 'coc'
nmap <Leader>v :Vista!!<CR>

" BufOnly.vim  -  Delete all the buffers except the current/named buffer.
"
" Copyright November 2003 by Christian J. Robinson <infynity@onewest.net>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Bonly / :BOnly / :Bufonly / :BufOnly [buffer]
"
" Without any arguments the current buffer is kept.  With an argument the
" buffer name/number supplied is kept.

command! -nargs=? -complete=buffer -bang Bonly
      \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly
      \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly
      \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly
      \ :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
  if a:buffer == ''
    " No buffer provided, use the current buffer.
    let buffer = bufnr('%')
  elseif (a:buffer + 0) > 0
    " A buffer number was provided.
    let buffer = bufnr(a:buffer + 0)
  else
    " A buffer name was provided.
    let buffer = bufnr(a:buffer)
  endif

  if buffer == -1
    echohl ErrorMsg
    echomsg "No matching buffer for" a:buffer
    echohl None
    return
  endif

  let last_buffer = bufnr('$')

  let delete_count = 0
  let n = 1
  while n <= last_buffer
    if n != buffer && buflisted(n)
      if a:bang == '' && getbufvar(n, '&modified')
        echohl ErrorMsg
        echomsg 'No write since last change for buffer'
              \ n '(add ! to override)'
        echohl None
      else
        silent exe 'bdel' . a:bang . ' ' . n
        if ! buflisted(n)
          let delete_count = delete_count+1
        endif
      endif
    endif
    let n = n+1
  endwhile

  if delete_count == 1
    echomsg delete_count "buffer deleted"
  elseif delete_count > 1
    echomsg delete_count "buffers deleted"
  endif

endfunction

nmap <Leader>o :BufOnly<CR>
