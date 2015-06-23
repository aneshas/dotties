" Pathogen
execute pathogen#infect()
call pathogen#helptags()

syntax on
set shell=/bin/bash

" color schemes
set background=dark
set t_Co=256
" colorscheme distinguished
" colorscheme inori
" colorscheme molokai
" colorscheme mango
" solarized
let g:solarized_termcolors=256
" colorscheme solarized
" colorscheme phoenix
colorscheme railscasts

" line numbers
set number

" remap leader key
let mapleader=","

" use system clipboard
set clipboard=unnamed

" disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" remap END key
nnoremap 0 $
nnoremap 9 0

" Incremental search
set incsearch

" vim-airline
set laststatus=2

" vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" vim-javascript
" au FileType javascript call JavaScriptFold()
set foldlevelstart=99

" vim-node-dict
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict

" command-t
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>

" syntacsic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" tagbar
nmap <F8> :TagbarToggle<CR>

" Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap <Leader>s <Plug>(easymotion-s)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-s2)
"
" " Turn on case insensitive feature
" let g:EasyMotion_smartcase = 1
"
" " JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" esformater
nnoremap <silent> <leader>e :call JSFormat()<cr>

function! JSFormat()
    let l:win_view = winsaveview()
    let l:last_search = getreg('/')
    let fileWorkingDirectory = expand('%:p:h')
    let currentWorkingDirectory = getcwd()
    execute ':lcd' . fileWorkingDirectory
    execute ':silent' . '%!esformatter'
    if v:shell_error
        undo
        execute ":silent normal! gg=G<cr>"
    endif
    execute ':lcd' . currentWorkingDirectory
    call winrestview(l:win_view)
    call setreg('/', l:last_search)
endfunction

" Plugins
" Plugin 'moll/vim-node'
" Plugin 'jelera/vim-javascript-syntax'

" call vundle#end()            " required
filetype plugin indent on    " required

" Tabs
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Use :w!! to save with sudo if you're editing a readonly file
cmap w!! w !sudo tee % >/dev/null

" NERDTree toggle with ,`
map <leader>` :NERDTreeToggle<CR>

" TagBar with ,\
map <leader>\ :TagbarToggle<CR>

" Resize window to 80 width with ,8
map <leader>8 :vertical resize 80<CR>

" ,f to find in nerdtree
map <leader>f :NERDTreeFind<CR>

" netrw
let g:netrw_liststyle=3
let g:netrw_winsize=25 
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_banner = 0
map <leader>q :vs.<CR>
map <leader>w :Vex<CR>

" autoclose nerdtree 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" nerdtree file type highlight
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
     exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
      exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
