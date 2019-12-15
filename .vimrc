""" Plugins """

call plug#begin('~/.local/share/nvim/plugged')

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

" Language
Plug 'plasticboy/vim-markdown'
Plug 'Valloric/YouCompleteMe'

" Spacing
Plug 'godlygeek/tabular'
Plug 'ntpeters/vim-better-whitespace'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'rhysd/vim-clang-format'

" Aesthetic
Plug 'whoshuu/tabline.vim'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" Misc
Plug 'vim-scripts/AnsiEsc.vim'

call plug#end()

""" Aesthetics """

let g:seoul256_background = 233
"colorscheme base16-atlas
colorscheme seoul256
set background=dark
set regexpengine=1
set scrolloff=5
set hidden
set wildmenu
set completeopt=menu
set colorcolumn=100
set showcmd
set incsearch
set hlsearch
set ignorecase
set backspace=indent,eol,start
set autoindent
set smartindent
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set cmdheight=1
set number
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set nobackup
set nowb
set noswapfile
set showmatch
set synmaxcol=1000
set encoding=utf-8
set t_Co=256
set termencoding=utf-8
set noshowmode
set guitablabel=%f\ %M
if has('nvim')
    set mouse=
endif

" Highlights
highlight LineNr ctermfg=Gray ctermbg=Black
highlight CursorLineNr ctermfg=Blue ctermbg=Black
highlight Search ctermfg=Black ctermbg=Yellow
highlight VertSplit ctermfg=0 ctermbg=0
"highlight ColorColumn ctermbg=233
"highlight CursorLine ctermbg=233
"highlight StatusLine ctermfg=233 ctermbg=Blue
highlight ColorColumn ctermbg=234
highlight CursorLine ctermbg=234
highlight StatusLine ctermfg=233 ctermbg=Blue
highlight TabLineSel ctermfg=White ctermbg=Black
highlight TabLine ctermfg=Gray ctermbg=Black
highlight TabLineFill ctermfg=Black ctermbg=Gray
"highlight VertSplit ctermfg=Black ctermbg=Black
"highlight ColorColumn ctermbg=Blue
"highlight CursorLine ctermbg=Blue
"highlight StatusLine ctermfg=Blue ctermbg=Blue

highlight ExtraWhitespace ctermbg=Red

""" Bindings """

" Leader
let mapleader=","
if has('nvim')
    nnoremap <silent> <Leader>g :Te<CR>:term tig<CR>a
else
    nnoremap <silent> <Leader>g :!tig<CR>
endif
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>o :Vexplore<CR> <C-W>=
nnoremap <silent> <Leader>p :Sex<CR> <C-W>=
nnoremap <silent> <Leader>e :Ex<CR>
nnoremap <silent> <Leader>t :Files<CR>
" The whitespace here is intentional
nnoremap <silent> <Leader>f :Rg<Space>
vnoremap <silent> <Leader>f y:Rg <C-R>"<CR>

command! -bang ProjectFiles call fzf#vim#files('$PROJECT_DIR', <bang>0)

" Sort selected block in Visual mode or all text in Command mode
map <silent> <Leader>s :sort u<CR>

" Window navigation
" If ctrl + h is broken, run this:
" infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
" tic $TERM.ti
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-g> :ProjectFiles<CR>

" Tab navigation
nnoremap <silent> <C-t> :Te<CR>
nnoremap <silent> <C-a> :tabp<CR>
nnoremap <silent> <C-d> :tabn<CR>

nnoremap # :keepjumps normal! mi*`i<CR>

if has('nvim')
    tnoremap <silent> <C-h> <C-\><C-n><C-w>h
    tnoremap <silent> <C-j> <C-\><C-n><C-w>j
    tnoremap <silent> <C-k> <C-\><C-n><C-w>k
    tnoremap <silent> <C-l> <C-\><C-n><C-w>l
    tnoremap <silent> <C-a> <C-\><C-n>:tabp<CR>
    tnoremap <silent> <C-d> <C-\><C-n>:tabn<CR>

    au TermClose * call feedkeys('<cr>')
    au BufWinEnter,WinEnter term://* startinsert
endif

vnoremap p "_dP
let g:pymode=0
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Visual mode indentation
vmap > >gv
vmap < <gv

""" Misc """
let g:vim_markdown_folding_disabled = 1

let g:go_fmt_command = "goimports"
autocmd VimResized * :wincmd =
let g:NERDSpaceDelims=1
function OpenNERDTree()
    if &buftype !=# 'terminal'
        NERDTree
        wincmd w
    endif
endfunction
nnoremap <Leader>d :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:nerdtree_tabs_open_on_console_startup = 0
let g:fzf_layout = { 'window': '-tabnew' }
command! Plugs call fzf#run({
  \ 'source':  map(sort(keys(g:plugs)), 'g:plug_home."/".v:val'),
  \ 'options': '--delimiter / --nth -1',
  \ 'down':    '~40%',
  \ 'sink':    'Explore'})

let g:go_def_mapping_enabled = 0
au Filetype go nnoremap gd :tab split<CR>:GoDef<CR>
au Filetype go nnoremap gD :sp<CR>:GoDef<CR>
let g:ycm_confirm_extra_conf = 0
autocmd BufWritePost *.c YcmForceCompileAndDiagnostics
autocmd BufWritePost *.cpp YcmForceCompileAndDiagnostics
au Filetype cpp nnoremap gd :tab split<CR>:YcmCompleter GoTo<CR>
au Filetype python nnoremap gd :tab split<CR>:YcmCompleter GoTo<CR>
au Filetype python nnoremap gD :YcmCompleter GoToDeclaration<CR>
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
function! WrapCommand(direction, prefix)
    if a:direction == "up"
        try
            execute a:prefix . "previous"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "last"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    elseif a:direction == "down"
        try
            execute a:prefix . "next"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "first"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    endif
endfunction
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

" <C-Home> and <C-End> go up and down the location list and wrap around
nnoremap <silent> m :call WrapCommand('down', 'l')<CR>
nnoremap <silent> M :call WrapCommand('up', 'l')<CR>
let g:ycm_python_binary_path = 'python3'
