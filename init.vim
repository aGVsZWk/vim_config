" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set for clipboard
let &t_ut=''
set autochdir

" editor behavior
set nocompatible
set number
set encoding=utf-8
" set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set timeoutlen=1000 ttimeoutlen=0
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set formatoptions-=tc
set splitright
set ruler
set cursorline
" set splitbelow
set mouse=a
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

filetype plugin indent on
syntax on

call plug#begin('~/.local/share/nvim/plugged')

" contents plug
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" tag plug
Plug 'majutsushi/tagbar'

" complete plug
" Plug 'ncm2/ncm2'
" Plug 'ncm2/ncm2-jedi'


" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-github'
" Plug 'ncm2/ncm2-vim'
" Plug 'ncm2/ncm2-match-highlight'

Plug 'davidhalter/jedi-vim'

Plug 'mattn/emmet-vim'

Plug 'Raimondi/delimitMate'

if has('nvim')
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
 Plug 'Shougo/deoplete.nvim'
 Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'


Plug 'zchee/deoplete-jedi'


Plug 'glench/vim-jinja2-syntax'

" beauty plug
Plug 'Yggdroot/indentLine'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/goyo.vim'

Plug 'luochen1990/rainbow'

" differ plug
Plug 'mhinz/vim-signify'

" syntax plug
" Plug 'w0rp/ale'
Plug 'dense-analysis/ale'


" efficient plug
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'tpope/vim-repeat'

" Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'

Plug 'godlygeek/tabular'
" other plug
Plug 'plytophogy/vim-virtualenv'


" colorscheme
Plug 'vim-scripts/SlateDark'
Plug 'vim-scripts/abbott.vim'
Plug 'gmarik/ingretu'
Plug 'mopp/mopkai.vim'
" Plug 'altercation/solarized'
Plug 'fxn/vim-monochrome'
Plug 'tpope/vim-vividchalk'

" be depended plug
Plug 'roxma/nvim-yarp'
Plug 'Shougo/neco-vim'


call plug#end()

map tb :TagbarToggle<CR>
map tt :NERDTreeToggle<CR>

map <C-m> <Plug>NERDCommenterToggle


" Ncm2 or deoplete config
set shortmess+=c
set notimeout
" Use tab and shift+tab to complete
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect

" let g:ncm2#popup_delay = 0
" let g:ncm2#matcher = 'substrfuzzy'
" let g:ncm2#match_highlight = 'mono-space'
" let g:ncm2_jedi#python_version = 3

" deoplete config
let g:auto_complete_delay = 0
let g:auto_refresh_delay = 0


" emmet config
let g:user_emmet_leader_key = '<Tab>'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


" Set tabs display as buffers when only one file was opened
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


" Set syntax check
let g:ale_linters = {
\    'javascript': ['eslint'],
\    'css': ['stylelint'],
\    'python': ['flake8', 'pylint']
\}
let g:ale_linters_ignore = {'python': ['pylint']}
" " Set syntax correct
let g:ale_fixers= {
\    'javascript': ['eslint'],
\    'css': ['stylelint'],
\    'python': ['autopep8']
\}

" map auto-format key
noremap <F5> :ALEFix<CR>w<CR>

noremap gb :bn<CR>
noremap gB :bp<CR>


" Leaderf search result reverse
let g:Lf_ReverseOrder = 1
" if you use git or svn, auto generate gtags when you first open file
" let g:Lf_GtagsAutoGenerate = 1
" let g:Lf_Gtagslabel = 'native-pygments'
" Custom search Leaderf tag
noremap <Leader>t :Leaderf tag<CR>

" snippets display in taps
let g:deoplete#enable_at_startup = 1

" C-k to select-and-expand a snippet from the deoplete popup (Use C-n and C-p
" to select it). C-k can also be used to jump to the next field in the
" snippet.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)



" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Tab to select the next field to fill in the snippet.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
