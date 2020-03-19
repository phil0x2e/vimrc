"  ____________
" / phil02e's  \
" |            |
" \ vimrc      /
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
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vundle plugins
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'vim-syntastic/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'machakann/vim-highlightedyank'
Plugin 'easymotion/vim-easymotion'
Plugin 'ryanoasis/vim-devicons'
" Colorschemes
Plugin 'morhetz/gruvbox'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'dracula/vim'

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
" }}}
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

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Nerdtree Arrows as + and -
let g:NERDTreeDirArrowExpandable = "+"
let g:NERDTreeDirArrowCollapsible = "-"

" Highlighted yank
let g:highlightedyank_highlight_duration = 300
" }}}
" ==================== Config ==================== {{{
syntax on
set nu
set relativenumber
set tabstop=4
set smarttab
set shiftwidth=4
set autoindent
set ignorecase
set smartcase
set hlsearch
set incsearch
set background=dark
set termguicolors " disable when using urxvt!
set foldmethod=manual

colorscheme gruvbox
" }}}
" ==================== Mappings ==================== {{{
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
map Y y$
" <C-S> to start easymotion instead of <leader><leader>
map <C-S> <Plug>(easymotion-prefix)
" Start NERDTree with ,t
nnoremap ,t :NERDTree<CR>
" Esc to stop highlighting
nnoremap <Esc> :nohl<CR><C-L>
" }}}
" ==================== Extended Settings ==================== {{{
" Remove trailing whitespaces for specific files on save
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre *.h,*.c,*.java,*.py,*.rs,*.toml,*.cpp,*.yaml,*.yml,*vimrc,.gitignore,*.md :call <SID>StripTrailingWhitespaces()
" Make the whitespace remover function accessible via two commands
command! TrimWhitespace call <SID>StripTrailingWhitespaces()
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
" Use foldmethod marker on vim files to automatically fold vimrc
" To toggle fold use za. To open all folds use zR and to close all folds use ZM.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
