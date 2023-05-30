set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,chinese,latin-1,gbk,gb18030,gk2312

set laststatus=2
set statusline+=\ %f
set statusline+=\ %M
set statusline+=\ %R
set statusline+=%=
set statusline+=\ %{strftime('%T')}
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %l:%c
set statusline+=\ %p%%

set listchars=tab:->\ 
set backspace=indent,eol,start
set nowrap
set wrapmargin=2
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set expandtab
set tabstop=4
set softtabstop=2
set shiftwidth=4
set cmdheight=1
set showcmd
set hidden
set relativenumber
set number
set mouse=a
set autoread
set autoindent
set showmatch
set wildmenu
set ignorecase
set smartcase
set foldenable
set foldmethod=indent
set foldlevel=100
set linebreak
set scrolloff=5
set ruler
syntax on
filetype indent on

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

noremap <space>tt :call ToggleNetrw()<CR>
