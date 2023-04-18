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

Plugin 'Valloric/YouCompleteMe'
" Plugin 'scrooloose/syntastic'
Plugin 'pearofducks/ansible-vim'
Plugin 'w0rp/ale' " TODO: Figure out how to integrate this with YCM

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

" ==== Airline Settings ====
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections =1
let g:arline#parts#ffenc#skip_expected_string='utf-8[unix]' "No need to display the file encoding if it's what's expected


" Enable syntax highlighting
syntax enable

" Rainbow Parens on
let g:rainbow_active = 1
" let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
" let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
" ==== Generic Settings ====
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
set hlsearch                                  " Highlight all search hits
set nospell                                   " Disable spell checking
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set modeline                                  " Allow modelines - they're useful
set smartcase
set ignorecase
set balloondelay=100

" ==== Terminal settings ====
" Mouse settings
set mouse=a                                   " Allow mouse navigation and interaction
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''

" ====  ALE Settings ====
" NOTE: A lot of these settings need to be set *before* ALE loads
" Global Linting Options
let g:ale_lint_on_enter = 1 " Lint when opening a buffer
let g:ale_lint_on_save = 1
let g:ale_lint_insert_leave = 1
let g:ale_lint_on_text_changed = 1 " Don't lint while we're typing

" Global Fixing Options
let g:ale_fix_on_save = 1

let g:ale_fixers = {
      \ 'python': ['black','trim_whitespace'],
      \ 'ansible': ['trim_whitespace'],
      \}

nmap <F8> <Plug>(ale_fix)

" Reporting Options
let g:ale_set_balloons = 1
let g:ale_set_signs = 1
let g:ale_set_echo_cursor = 1

let g:ale_linters = {
      \ 'python': ['mypy','pylint'],
      \ 'ansible': ['ansible-language-server','ansible-lint'],
      \}

" ==== YCM settings ====
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Remap ctrl+arrows to move between window splits
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

" ==== Spellcheck Settings ====
set spelloptions=camel
map <leader>ss :setlocal spell!<cr>

" armor


hi SpellBad ctermbg=none ctermfg=none cterm=undercurl
hi SpellCap ctermbg=none ctermfg=none cterm=undercurl
hi SpellRare ctermfg=none ctermfg=none cterm=underdotted
hi SpellLocal ctermbg=none ctermfg=none cterm=underdashed

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
hi EasyMotionTarget2Second ctermbg=none ctermfg=1 cterm=bold
hi EasyMotionIncSearch ctermbg=none ctermfg=10 cterm=bold
hi EasyMotionMoveHL ctermbg=none ctermfg=10 cterm=bold
hi EasyMotionShade ctermbg=none ctermfg=7
hi Search ctermbg=none ctermfg=none cterm=underline

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
set foldlevel=2
hi Folded ctermfg=4 ctermbg=0

" Use whitespace-alignment allowing algo for airline
let g:airline#extensions#whitespace#mixed_indent_algo = 2
let g:airline#extensions#whitespace#skip_indent_check_ft =
   \  {'markdown': ['mixed-indent-file']}
" Filetype dependant tabs because tabstops are better
autocmd FileType text {
setlocal shiftwidth=2 tabstop=2 spl=en_au
set spell
}
autocmd FileType markdown {
  setlocal shiftwidth=2 tabstop=2 spl=en_au
  set spell
}

" Correctly detect Ansible files
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile *.yml set filetype=yaml.ansible

" Disable "recommended style" as it uses 4 space tabs
let g:markdown_recommended_style = 0

" Source in our theme if we're on a non-transparent terminal, or somewhere we
" care about distinguishing things
call SourceIfExists("~/.vim-theme")
