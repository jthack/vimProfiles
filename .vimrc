"Vim Configuration File
"Description: Optimized for C/C++ development, but useful also for other things.
"Author: Joseph Thacker
"disable vi compatibility (emulation of old bugs)
set nocompatible
"abbreviations
:ab #b /******************************************
:ab #e ******************************************/
"set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
"use indentation of previous line
set autoindent
"use intelligent indentation 
set smartindent
"configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
"wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
"turn syntax highlighting on
set t_Co=256
syntax on
colorscheme pablo 
"turn line numbers on
set number
"highlight matching braces
set showmatch
"intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
"incremental search
set incsearch
"sets g on search and replace
set gdefault
"sets folds
set foldenable
" Always show the status line
set laststatus=2
"show what command is in the bottom
set showcmd
" Format the status line
function! InsertStatuslineColor(mode)
    if a:mode == 'i'
        hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
    elseif a:mode == 'r'
        hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
    else
        hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
    endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" Formats the statusline
set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag

set statusline+=\ %=
" align left
set statusline+=Line:%l/%L[%p%%]
" line X of Y [percent of file]
set statusline+=\ Col:%c
" current column
set statusline+=\ Buf:%n
" Buffer number
set statusline+=\ [%b][0x%B]\
" ASCII and byte code under cursor
"set scroll off
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set scrolljump=5              " jumps 5 lines when at the bottom of a file for faster scrolling
set wildmenu                  " when you have multiple options at : line, you can tab for menu
set wildmode=list:longest,full
" visual shifting (does not exit Visual mode when indenting)
vnoremap < <gv
vnoremap > >gv 

"in normal mode F2 will save the file
nmap <F2> :w<CR>
"in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
"switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
"recreate tags file with F5
map <F5> :!ctags -R .c++-kinds=+p .fields=+iaS .extra=+q .<CR>
"build using makeprg with <F7>
map <F7> :make<CR>
"build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
"goto definition with F12
map <F12> <C-]>
