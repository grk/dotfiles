" Hide toolbar and menus.
set guioptions-=T
set guioptions-=m

" Scrollbar is always off.
set guioptions-=rL

" Enable gui tab labels
set guioptions+=e

" Disable bell.
set vb t_vb=

" Don't flick cursor.
set guicursor=a:blinkon0

" TABS: safari style tab navigation
nmap <D-[> :tabprevious<CR>
nmap <D-]> :tabnext<CR>
map <D-[> :tabprevious<CR>
map <D-]> :tabnext<CR>
imap <D-[> <C-O>:tabprevious<CR>
imap <D-]> <C-O>:tabnext<CR>
" TABS: Firefox style, open tabs with command-<tab number>
map <silent> <D-1> :tabn 1<CR>
map <silent> <D-2> :tabn 2<CR>
map <silent> <D-3> :tabn 3<CR>
map <silent> <D-4> :tabn 4<CR>
map <silent> <D-5> :tabn 5<CR>
map <silent> <D-6> :tabn 6<CR>
map <silent> <D-7> :tabn 7<CR>
map <silent> <D-8> :tabn 8<CR>
map <silent> <D-9> :tabn 9<CR>
" Unmap Apple+T so we can...
macmenu &File.New\ Tab key=<nop>

" Change Apple+T to TextMate Like Fuzzy Finder
nnoremap <D-t> :FuzzyFinderTextMate<CR>
" Unmap Apple+Shift+T so we can...
macmenu &File.Open\ Tab\.\.\. key=<nop>

" Change Apple+Shift+T to TextMate Like Fuzzy Finder
nnoremap <D-T> :FuzzyFinderTag!<CR>
" Unmap Apple+b so we can...
macmenu &Tools.Make key=<nop>
" Change Apple+b to Emacseque buffer browser
map <D-b> :FuzzyFinderBuffer!<CR>
imap <D-b> :FuzzyFinderBuffer!<CR>
" Unmap Apple+S to remap to Esc, then :w<CR>
macmenu &File.Save key=<nop>
imap <D-s> <Esc>:w<CR>
map <D-s> :w<CR>

" Run file in shell mode with ruby
nnoremap <D-r> <Plug>RubyFileRun
map <D-r> <Plug>RubyFileRun

