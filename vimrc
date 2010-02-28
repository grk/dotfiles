runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
	call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
end

set nocompatible
"set noautochdir
set hidden

" make tabcomplete more like shell, i.e. complete to the last common character
set wildmode=list:longest

" ignore case when searching
set ignorecase
set smartcase

" show title in terminal
set title

set autoread
set autowrite

set splitright
set splitbelow

" keep more space around the cursor when scrolling
set scrolloff=3

" show line numbers and the ruler
set ruler
set number

" hilight cursor line
set cursorline

" indenting and tab settings
set autoindent
set smartindent

set tabstop=2
set shiftwidth=2

set t_Co=256
:colorscheme ir_dark

let mapleader = ","
let maplocalleader = ","

" hilight lines longer than 80 chars
nnoremap <silent> <Leader>l
			\ :if exists('w:long_line_match') <Bar>
			\   silent! call matchdelete(w:long_line_match) <Bar>
			\   unlet w:long_line_match <Bar>
			\ elseif &textwidth > 0 <Bar>
			\   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
			\ else <Bar>
			\   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
			\ endif<CR>

" incremental search wins
set incsearch

" so that tmp files dont create junk in project directories
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" make backspace go over everything
set backspace=indent,eol,start

" filetype stuff
syntax on
filetype on
filetype plugin on
filetype indent on

" enable mouse
set mouse=a


" some nice completions
imap jj <Esc>
imap uu _
imap hh =>
imap aa @

" invisible characters
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap <Leader>i :set list!<CR> " Toggle invisible chars


" for Markdown
augroup mkd
	autocmd BufRead *.mkd,*.mdown,*.markdown  set ai formatoptions=tcroqn2 comments=n:>
augroup END

" for Ruby
autocmd BufRead *.ru,*.rb,*.rbx,*.gem,*.gemspec,[rR]antfile,*.rant,[rR]akefile* set formatoptions=tcoq expandtab shiftwidth=2 tabstop=2

" Omni Completion
autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" May require ruby compiled in
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete 
autocmd FileType ruby,eruby compiler ruby


" NERDtree keybinds
noremap <Leader>n :NERDTreeToggle<CR>
let NERDTreeMouseMode=1

" fuzzyfinder_textmate
map <Leader>f :FuzzyFinderTextMate<CR>
map <Leader>b :FuzzyFinderBuffer<CR>

" Nice statusbar
set laststatus=2
set statusline=\ 
set statusline+=%f\ 
set statusline+=%{fugitive#statusline()}\ 
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&fileformat}] " file format
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=%= " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset


