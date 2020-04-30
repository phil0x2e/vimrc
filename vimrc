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
" ==================== Vim Plug ==================== {{{
call plug#begin('~/.vim/plugged')
" vim-plug plugins
"Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-highlightedyank'
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'
Plug 'vimwiki/vimwiki'
" Colorschemes
Plug 'morhetz/gruvbox'
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'dracula/vim'
call plug#end() "}}}
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

" ycm
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/'}]

" lightline
set laststatus=2
function! Trailing_whites()
	let pos = search('\s$', 'nw')
	if pos>0
		return '»Trailing[' . pos . ']'
	else
		return ''
	endif
endfun

function! Branch()
	let head = FugitiveHead()
	if head != ''
		return '⎇ ' . head
	else
		return ''
	endif
endfun

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
	\'colorscheme': 'gruvbox',
	\'active': {
	\    'left': [ [ 'mode', 'paste' ],
	\        ['gitbranch', 'readonly', 'filename', 'modified'], ['cocstatus'] ],
	\    'right': [ ['trailing_whites'], ['lineinfo' ],
	\        [ 'percent' ],
	\        [ 'fileformat', 'fileencoding', 'filetype'] ]
	\},
	\'component_function': {
	\    'gitbranch': 'Branch',
	\    'cocstatus': 'coc#status',
  	\    'currentfunction': 'CocCurrentFunction'
	\},
	\'component_expand': {
	\    'trailing_whites': 'Trailing_whites',
	\},
	\'component_type': {
    \    'trailing_whites': 'warning'
    \}
\}
"reevaluate component_expand
autocmd BufWritePost,FileWritePost * call lightline#update()
" }}}
" ==================== Config ==================== {{{
set nocompatible
filetype plugin on
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
set noshowmode " because lightline already shows mode
set spell
set spelllang=en_us,de_de

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
nnoremap <silent> <Esc><Esc> :nohl<CR>
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

augroup filetype_yaml
	autocmd!
	" Indentation two spaces
	autocmd FileType yaml setlocal expandtab sw=2 ts=2
augroup END
