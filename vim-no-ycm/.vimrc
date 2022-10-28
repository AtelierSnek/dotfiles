set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" original repos on github
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'klen/python-mode'

Plugin 'vim-scripts/hlint'

Plugin 'groenewege/vim-less'
Plugin 'ap/vim-css-color'
Plugin 'jelera/vim-javascript-syntax'

Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'

" Rainbow parens
Plugin 'frazrepo/vim-rainbow'

" All of your Plugins must be added before the following line
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

" Set the swap file directory
" Ensure that this exists, as vim won't create it for you
set directory^=$HOME/.vim/swap//

filetype plugin indent on

" Airline theme
let g:airline_theme='deus'

" Populate powerline font symbols
let g:airline_powerline_fonts = 1

" Enable syntax highlighting
syntax enable

" Rainbow Parens on
let g:rainbow_active = 1
" let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
" let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" Generic Settings
set modeline
set smartindent
set tabstop=2                                 " Tab key results in 2 spaces
set shiftwidth=2                              " The num of spaces for indenting
set backspace=indent,eol,start
set softtabstop=2                             " Tab key results in 2 spaces
set expandtab                                 " Expand tabs to spaces
set clipboard+=unnamed
set clipboard+=unnamedplus                    " Allow pasting from outside vim, since that gets stored in +
set go+=a
set number                                    " Enable line numbers
set laststatus=2                              " Always show statusline
set foldenable
set foldmethod=syntax                         " Markers are used to specify folds
set foldopen=block,hor,percent,quickfix,tag
set foldlevel=1
set hlsearch                                  " Highlight all search hits
set nospell                                   " Disable spell checking
set colorcolumn=121                           " Highlight column 121 for line length indicator
set mouse=a                                   " Allow mouse navigation and interaction
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set modeline                                  " Allow modelines - they're useful


"YCM settings
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

" Make syntastic work nicer
let g:syntastic_enable_balloons = 1

" Map f8 for Tagbar
nmap <F8> :TagbarToggle<CR>

" Remap ctrl+arrows to move between window splits
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

" Remap space for use with easymotion
map <Space> \\w

map <leader>ss :setlocal spell!<cr>


map <leader>l :set list!<cr>

" Map enter to clear highlighted search hits
nnoremap <CR> :nohlsearch<CR><CR>

" QuickFix close function; :q should close a window *and* the accompanying
" quickfix
aug QFClose
  au!
  " if |q| doesn't work use |cclose| ?
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" Javascript folding that doesn't suck
let javaScript_fold=1
au FileType javascript call JavaScriptFold()

" Conceal
set conceallevel=2
hi Conceal ctermfg=6 ctermbg=1

" Use whitespace-alignment allowing algo for airline
let g:airline#extensions#whitespace#mixed_indent_algo = 2
let g:airline#extensions#whitespace#skip_indent_check_ft =                                                             
   \  {'markdown': ['mixed-indent-file']}    
" Filetype dependant tabs because tabstops are better
autocmd FileType txt setlocal shiftwidth=2 tabstop=2 noexpandtab spell
autocmd FileType md setlocal shiftwidth=2 tabstop=2 noexpandtab spell
