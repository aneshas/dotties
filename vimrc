" Pathogen
execute pathogen#infect()
call pathogen#helptags()

set title

syntax on
set shell=/bin/bash
call togglebg#map("<F5>")

" vertical line styling
set fillchars=vert:│
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE

" required for base16 colorscheme
let base16colorspace=256

" gruvbox
let g:gruvbox_contrast_dark = "hard"

" color schemes
set background=dark
set t_Co=256
let g:solarized_termcolors=256
" colorscheme gruvbox 
" colorscheme solarized
" colorscheme base16-default 
" colorscheme distinguished
" colorscheme inori
colorscheme molokai
" colorscheme hybrid 
" colorscheme mango
" colorscheme phoenix
" colorscheme railscasts
" colorscheme oxeded
" colorscheme kalahari
" colorscheme feral
" colorscheme abra
" colorscheme nefertiti
" colorscheme sorcerer
" colorscheme znake
" colorscheme gotham

" line numbers
highlight LineNr ctermfg=240
highlight LineNr ctermbg=233
set number

" normal mode enter to go to line
nnoremap <CR> G

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

" dwlimitmate ident after braces
let delimitMate_expand_cr=1

" remap END key
nnoremap 0 $
noremap 0 $
nnoremap 9 0
noremap 9 0

" Incremental search
set incsearch

" vim-airline
set laststatus=2

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" vundle
set nocompatible              " be iMproved, required
filetype off                  " required
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

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
let g:CommandTFileScanner = "git"
let g:CommandTGitScanSubmodules = 0

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

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
let g:netrw_winsize=17
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
let g:go_disable_autoinstall = 0
let g:go_fmt_command = "goimports"

"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" tagbar
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

nmap <F8> :TagbarToggle<CR>
let g:tagbar_show_line_numbers = 2
" let g:tagbar_autopreview = 1
autocmd VimEnter * nested :call tagbar#autoopen(1)

" vim-go
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>gi <Plug>(go-imports)

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let javascript_enable_domhtmlcss=1

" Fugitive
set diffopt+=vertical

" vim-airline
let g:airline_powerline_fonts = 1

" rust
let g:rustfmt_autosave = 1
