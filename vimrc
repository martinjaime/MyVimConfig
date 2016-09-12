""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin()/end().
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" Plugin on GitHub repo.
Plugin 'tpope/vim-fugitive' " add git funcitonality

"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'

"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Javascript and JS-based languages
" Plugin 'othree/javascript-libraries-syntax'

" Quote and parenthesis autocompletion
Plugin 'Raimondi/delimitMate'

" Git gutter info to display added, modified, and removed lines.
Plugin 'airblade/vim-gitgutter'

" Livescript plugin
Plugin 'gkz/vim-ls'

" Scala plugin
Plugin 'derekwyatt/vim-scala'

" Autocomplete plugin.
Plugin 'Valloric/YouCompleteMe'

" CoffeeScript support | added Thu May 19 11:57:17 PDT 2016
Plugin 'kchmck/vim-coffee-script'

" Javascript support | added Thu May 19 14:59:56 PDT 2016
"Plugin 'pangloss/vim-javascript'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" Git plugin for Nerdtree
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Tmux navigation plugin
Plugin 'christoomey/vim-tmux-navigator'

" Lean & mean status/tabline for vim that's light as air.
Plugin 'vim-airline/vim-airline'
" See https://github.com/vim-airline/vim-airline/wiki/Screenshots
" For theme previews
Plugin 'vim-airline/vim-airline-themes'
" Set vim-airline theme with
let g:airline_theme='bubblegum'

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

" Open NerdTree if no files were specified (if |argv| == 0)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"End Vundle setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap the leader to something more comfortable
let mapleader=","

map <leader>c "*y
map <leader>v "*p

" turn syntax dection on
syntax on

" Generic config
set backspace=indent,eol,start  " Backspace for dummies
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
"set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
"set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set list                        " Show problematic spaces
set guioptions-=T               " Remove the toolbar
"set nobackup                    " no backup - use git like a normal person
"set noswapfile                  " no swap file
set splitbelow                  " horizontal windows always split below
set splitright                  " vertical windows always split right
set completeopt-=preview
set title                       " show window title
set autoindent                  " autoindent when pressing Enter
set background=dark             " use a dark scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set tabstop=2                   " use 4 spaces for tabs
set shiftwidth=2
set softtabstop=2

set ls=2
set ruler
set showtabline=2
set formatoptions=qroct
set showcmd
"set mouse=a                     " allow mouse usage for all modes (a)
set spelllang=en_us             " current language
set cursorline                  " highlight the current line
set fileformat=unix             " unix file format by default
set fileformats=unix,dos,mac    " available formats
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
"set nowrap                      " Continue line outside of view
set colorcolumn=80              " set ruler at 80

" Enable colors
set t_Co=256
" color scheme
colorscheme lucid " i like this one
" colorscheme solarized

" Remember and reload file state. Not the file itself.
" Inteded for folds.
au BufWinLeave .*. mkview
au BufWinEnter .*. silent loadview

" Detect file types
autocmd BufRead,BufNewFile *httpd*.conf setfiletype apache "Apache config files
autocmd BufRead,BufNewFile .htaccess    setfiletype apache "htaccess files
autocmd BufRead,BufNewFile *inc         setfiletype php "PHP include files
autocmd BufRead,BufNewFile *phtml       setfiletype php "Zend framework templates

autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        set omnifunc=phpcomplete#CompletePHP

" Kill sounds
set vb

autocmd FileType crontab    setlocal nobackup nowritebackup

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Useful Remaping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Avoid typos when qitting and writing
"noremap :W :w
"noremnp :Q :q

" Toggle NERDTree
nmap <silent> <C-D> :NERDTreeToggle<CR>

" Typing ii will switch to Normal mode.
imap ii <Esc>

" <Ctrl-c> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-c> :nohl<CR><C-l>

" Remap controls for moving between splits to simply <Ctrl-x> where x is the
"       move key.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Enable clipboard sharing -- doesn't work
"set clipboard=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete functionality. Uncomment if YouCompleteMe does not work.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Use TAB to complete when typing words, else inserts TABs as usual.
""Uses dictionary and source files to find matching words to complete.
"See help completion for source,
""Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
""Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words
