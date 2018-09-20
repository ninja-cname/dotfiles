set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'w0rp/ale'
Plugin 'vimwiki/vimwiki'
Plugin 'junegunn/goyo.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 
highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
nnoremap H :bprevious<CR>
nnoremap L :bnext<CR>
set encoding=utf-8
let python_highlight_all=1
set t_Co=256
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:nerdtree_tabs_open_on_gui_startup=0
map <C-n> :NERDTreeToggle<cr>
set nu
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
let g:ale_completion_enabled = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP $HOME'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_follow_symlinks = 1
let g:vimwiki_list = [{'path': '[PATH TO VIMWIKI]'}]
autocmd BufRead,BufNewFile *.md,*.wiki set spell spelllang=en
set spellfile=[PATH TO SPELLFILE]/enspellfile.utf-8.add
au BufRead,BufNewFile *.md set textwidth=80
au BufRead,BufNewFile *.md set colorcolumn=+1
set guioptions=m
if has('gui_running')
    let g:solarized_contrast = 'high'
    set guifont=Droid\ Sans\ Mono\ Awesome
    set antialias
    set background=light
    colorscheme solarized
else
    colorscheme zenburn
endif
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
