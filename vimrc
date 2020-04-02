"  ____________
" / phil02e's  \
" |  awesome   |
" \   vimrc    /
"  ------------
"       \                    / \  //\
"        \    |\___/|      /   \//  \\
"             /0  0  \__  /    //  | \ \
"            /     /  \/_/    //   |  \  \
"            @_^_@'/   \/_   //    |   \   \
"            //_^_/     \/_ //     |    \    \
"         ( //) |        \///      |     \     \
"       ( / /) _|_ /   )  //       |      \     _\
"     ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
"   (( / / )) ,-{        _      `-.|.-~-.           .~         `.
"  (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
"  (( /// ))      `.   {            }                   /      \  \
"   (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
"              ///.----..>        \             _ -~             `.  ^-`  ^-_
"                ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
"                                                                   /.-~
" ==================== Vundle ==================== {{{
" -------------------- Vundle begin -------------------- {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here') }}}
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vundle plugins
Plugin 'ycm-core/YouCompleteMe'
Plugin 'preservim/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'vim-syntastic/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'machakann/vim-highlightedyank'
Plugin 'easymotion/vim-easymotion'
Plugin 'ryanoasis/vim-devicons'
" Colorschemes
Plugin 'morhetz/gruvbox'
"Plugin 'drewtempelmeyer/palenight.vim'
"Plugin 'dracula/vim'
" -------------------- Vundle end -------------------- {{{
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}} }}}
" ==================== Plugin settings ==================== {{{
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

" Nerdtree Arrows as + and -
let g:NERDTreeDirArrowExpandable = "+"
let g:NERDTreeDirArrowCollapsible = "-"
" Don't let NERDTree hijack Netrw, so when using e.g. :e it's opened with netrw
let NERDTreeHijackNetrw=0

" Ctrl-p
let g:ctrlp_working_path_mode = 0
" Ignore those files when searching
set wildignore+=*.pdf,*.jpeg,*.jpg,*.png,*.tif,*.doc,*.docx,*.ods,*.kdbx,*.kdb
set wildignore+=*.mp3,*.wav,*.mp4
set wildignore+=*.zip,*.7z,*.jar,*.tar,*.gz,*.iso,*.lz4,*.exe

" Highlighted yank
let g:highlightedyank_highlight_duration = 300

" lightline
function! Has_trailing_whites()
	let pos = search('\s$', 'nw')
	if pos>0
		return '>>Trailing[' . pos . ']'
	else
		return ''
	endif
endfun

function! Branch()
	let head = FugitiveHead()
	if head != ''
		return '⎇ ' . head
	endif
endfun

let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified'] ],
	\ 'right': [ ['trailing_whites'], ['lineinfo' ],
	\              [ 'percent' ],
	\              [ 'fileformat', 'fileencoding', 'filetype'] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'Branch',
	\   'trailing_whites': 'Has_trailing_whites'
	\},
	\ 'component_type': {
    \    'trailing_whites': 'error'
    \ }
	\}
" }}}
" ==================== Config ==================== {{{
syntax on
set nu
set relativenumber
set tabstop=4
set smarttab
set shiftwidth=4
set noexpandtab " Use tabs as default for indentation!
set autoindent
set ignorecase
set smartcase
set hlsearch
set incsearch
set background=dark
set termguicolors " disable when using urxvt!
set foldmethod=syntax
set nofoldenable

" \ is hard to reach, so set <leader> to ,
let mapleader = ","
" netrw hide dotfiles as default, toggle with gh
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex

colorscheme gruvbox
" }}}
" ==================== Mappings ==================== {{{
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
map Y y$
" Move between splits with Ctrl+movement keys
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Also start CtrlPMixed with ,p
nnoremap <leader>p :CtrlPMixed<CR>
" Start CtrlPFunky
nnoremap <leader>f :CtrlPFunky<CR>
" Start CtrlP on Buffers
nnoremap <leader>b :CtrlPBuffer<CR>
" Open CtrlPLine
nnoremap <leader>l :CtrlPLine<CR>
" Start NERDTree with <leader>t
nnoremap <leader>t :NERDTree<CR>
" Esc to stop highlighting
nnoremap <Esc> :nohl<CR><C-L>
" Quicksave with <leader>w
nmap <leader>w :w<cr>
" }}}
" ==================== Extended Settings ==================== {{{
function! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun
" Make the whitespace remover function accessible via two commands
command! TrimWhitespace call <SID>StripTrailingWhitespaces()
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
" }}}
" ==================== Filetype specific settings ==================== {{{
" Remove trailing whitespaces for specific files on save
autocmd BufWritePre *.h,*.c,*.java,*.py,*.rs,*.toml,*.cpp,*.yaml,*.yml,*vimrc,.gitignore,*.md :call <SID>StripTrailingWhitespaces()
" Use foldmethod marker on vim files to automatically fold vimrc
" To toggle fold use za. To open all folds use zR and to close all folds use ZM.
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType vim setlocal foldenable
augroup END

augroup filetype_python
	autocmd!
	" Indentation according to pep8
	autocmd FileType python setlocal expandtab sw=4 ts=4
augroup END

augroup filetype_sh
	autocmd!
	" display tabs as two spaces
	autocmd FileType sh setlocal noexpandtab sw=2 ts=2
augroup END
