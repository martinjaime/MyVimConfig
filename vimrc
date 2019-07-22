" need to set the shell, because it won't work with fish
set shell=/bin/bash\ -i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" File tree viewer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Git plugin for Nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

"Plugin 'L9'

" Javascript and JS-based languages
" Plug 'othree/javascript-libraries-syntax'

" Quote and parenthesis autocompletion
"Plugin 'Raimondi/delimitMate' disabling cuz buggy
Plug 'jiangmiao/auto-pairs'

" Git gutter info to display added, modified, and removed lines.
Plug 'airblade/vim-gitgutter'
set updatetime=400

" git commands
Plug 'tpope/vim-fugitive'

" Scala plugin
Plug 'derekwyatt/vim-scala'

" Autocomplete plugin.
Plug 'Valloric/YouCompleteMe'

" Tmux navigation plugin
Plug 'christoomey/vim-tmux-navigator'

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'
" See https://github.com/vim-airline/vim-airline/wiki/Screenshots
" For theme previews
Plug 'vim-airline/vim-airline-themes'
" Set vim-airline theme with
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

" vimwiki
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/Google\ Drive/vimwiki'}]

" csv.vim
Plug 'chrisbra/csv.vim'

" Javascript and jsx
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
" ES6
"Plugin 'isRuslan/vim-es6'

" autocomplete snippets of some languages
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Optional:
Plug 'honza/vim-snippets'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1 " disable folding
set conceallevel=2 " Conceal nonprinting markdown characters
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_autowrite = 1

" vim surround
Plug 'tpope/vim-surround'

" vim stylus
Plug 'wavded/vim-stylus'

" fish syntax highlighting
Plug 'dag/vim-fish'

" autoreload vim
Plug 'tmux-plugins/vim-tmux-focus-events'

" ctrlp: fuzzy file searching
Plug 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = '0'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" prettier for js, typescripts, less, scss, css, json, graphql, and markdown
Plug 'prettier/vim-prettier'

" Searcher using silver searcher
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev ag Ack!

" comments
Plug 'tpope/vim-commentary'

"" colorschemes
Plug 'flazz/vim-colorschemes'

" Syntax highlighting for Typescript
Plug 'leafgarland/typescript-vim'

" Typescript navigation, and completion. like IDE
" Plug 'quramy/tsuquyomi'

" " syntax checker for a shitton of languages
" Plug 'vim-syntastic/syntastic'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug setup end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Remap the leader to something more comfortable
let mapleader=","

" clipboard stuff
map <leader>c "*y
map <leader>v "*p

" turn syntax dection on
syntax on

" Generic config
set backspace=indent,eol,start  " Backspace for dummies
set number                      " Line numbers on
set relativenumber              " line numbers around cursor are relative
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
set autoread                    " detect change, trigger file read
au FocusGained,BufEnter * :checktime " trigger autoread when changing buffers
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
set mouse=a                     " allow mouse usage for a[ll] modes
set spelllang=en_us             " current language
set cursorline                  " highlight the current line
set fileformat=unix             " unix file format by default
set fileformats=unix,dos,mac    " available formats
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
"set nowrap                      " Continue line outside of view
set colorcolumn=80              " set ruler at 80

" Enable colors
set t_Co=256
" colorscheme lucid " i like this one
" colorscheme bubblegum-256-dark
" colorscheme molokai
" colorscheme solarized
colorscheme solarized8_light
" colorscheme lightning " very similar to solarized light. but better.

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


" NERDTree stuff
autocmd vimenter * NERDTree & NERDTree " Instantiate NERDTree on startup
" TODO: put the following into a function
nnoremap <silent> <expr> <C-D> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
nmap <silent> <C-B> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', 'node_modules', 'vendor']
let g:NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" close nerdtree if it's the only pane open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Typing jj or kk will switch to Normal mode.
imap jj <Esc>
imap kk <Esc>

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

" Enable clipboard sharing
set clipboard=unnamed

" Program to use for evaluating Python code. Setting this makes startup faster.
" Also useful for working with virtualenvs.
let g:python_host_prog  = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

let python_highlight_all=1
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
"function! Tab_Or_Complete()
"    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"        return "\<C-N>"
"    else
"        return "\<Tab>"
"    endif
"endfunction
":inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Enable project specific .vimrc files and disable autocmd shell commands
set exrc
set secure

" Strip trailing whitespaces
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

"autocmd FileType c,cpp,java,php,ruby,python,markdown autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Protect large files from sourcing and other overhead.
" Files become read only
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " Large files are > 10M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowrite (file is read-only)
  " undolevels=-1 (no undo possible)
  let g:LargeFile = 1024 * 1024 * 10
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
    augroup END
  endif
