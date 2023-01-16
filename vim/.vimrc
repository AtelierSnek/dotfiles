set nocompatible
filetype off                  " required

function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

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
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
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

" Themes
Plugin 'sainnhe/everforest'
Plugin 'drewtempelmeyer/palenight.vim'

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
set smartcase
set ignorecase

"YCM settings
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Make syntastic work nicer
let g:syntastic_enable_balloons = 1

" Map f8 for Tagbar
nmap <F8> :TagbarToggle<CR>

" Remap ctrl+arrows to move between window splits
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

" ==== Spellcheck Settings ====
map <leader>ss :setlocal spell!<cr>

hi SpellBad ctermbg=11 ctermfg=0 cterm=bold
hi SpellCap ctermbg=4 ctermfg=0 cterm=bold
hi SpellRare ctermfg=2 ctermfg=0 cterm=italic
hi SpellLocal ctermbg=2 ctermfg=0 cterm=italic

" ==== EasyMotion ====
let g:EasyMotion_smartcase = 1 
let g:EasyMotion_use_smartsign_us = 1
" Replace the default vim search with EasyMotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" Remap space for use with easymotion
map <Space> <Plug>(easymotion-jumptoanywhere)
map <leader><leader><Space> <Plug>(easymotion-overwin-line)

let g:EasyMotion_re_anywhere = '\v' . 
        \       '(<.|^$)' . '|' .
        \       '(\l)\zs(\u)' . '|' .
        \       '(_\zs.)' . '|' . 
        \       '(#\zs.)'

hi EasyMotionTarget ctermbg=none ctermfg=9 cterm=bold
hi EasyMotionTarget2First ctermbg=none ctermfg=9 cterm=bold
hi EasyMotionTarget2Second ctermbg=none ctermfg=1
hi EasyMotionIncSearch ctermbg=none ctermfg=10 cterm=bold
hi EasyMotionMoveHL ctermbg=none ctermfg=10 cterm=bold

" Show hidden chars
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
hi Conceal ctermfg=4 ctermbg=0

" Fold settings
hi Folded ctermfg=4 ctermbg=0

" Use whitespace-alignment allowing algo for airline
let g:airline#extensions#whitespace#mixed_indent_algo = 2
let g:airline#extensions#whitespace#skip_indent_check_ft =                                                             
   \  {'markdown': ['mixed-indent-file']}    
" Filetype dependant tabs because tabstops are better
autocmd FileType txt setlocal shiftwidth=2 tabstop=2 spell!
autocmd FileType md setlocal shiftwidth=2 tabstop=2 spell!

" Disable "recommended style" as it uses 4 space tabs
let g:markdown_recommended_style = 0

" Source in our theme if we're on a non-transparent terminal, or somewhere we
" care about distinguishing things
call SourceIfExists("~/.vim-theme")

" Fix broken backgrounds on kitty
let &t_ut=''
