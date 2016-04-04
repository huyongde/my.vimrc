set nocompatible

syntax on

set helplang=cn 
"" 设置帮助的语言 ,需要下载vimdoc压缩包，放到~/.vim/doc目录下并执行:helptags ~/.vim/doc
set nofoldenable
"set foldmethod=manual
"
"修改了vimrc配置，保存好自动生效
autocmd! BufWritePost ~/.vimrc   so ~/.vimrc 

"" Normal Mode gl 是跳转到上次修改的位置
nnoremap gl `. 

"" 插入模式下mm进入Normal Mode
inoremap mm    <ESC>

""Normal|Insert Mode下，",dt" 在当前光标后面添加日期时间
nmap ,dt a<C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR>
imap ,dt <C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR>

" search
set hlsearch "" highlight search 
set incsearch "" 增量搜索
set ignorecase "" 不区分大小写

""设置搜索高亮的模式
highlight Search ctermfg=Black ctermbg=green cterm=bold

"highlight Search ctermfg=Black ctermbg=Red cterm=bold

"set nowritebackup
" Ctrl-a selects everything
map <C-a> ggVG

" set tab stop
set tabstop=4
set shiftwidth=4
set expandtab

" encoding
" let &termencoding=&encoding
" set fileencodings=utf-8,gbk,ucs-bom,cp936
" set encoding=utf-8
" set fileencoding=utf-8
" set fileencodings=utf-8
" set termencoding=utf-8
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

set fenc=utf-8
"set fileencodings=utf-8,gb18030,utf-16,big5
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8

" no backup
"set nobackup
"set noswapfile

" use F3 for Ack current word in current dir
nnoremap <silent> <F3> :Ack <cword> <CR>

" use F7 for NCRETree
nnoremap <silent> <F7> :NERDTreeToggle<cr>

" tag list
nnoremap <silent> <F8> :TlistToggle<CR>


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>



" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable file type detection.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

else
    set autoindent		" always set autoindenting on
endif " has("autocmd")

" Title of the window
set title
set titlestring=%F\ %m

" Always keep 20 lines above and below the cursor if possible
set scrolloff=20

"highlight current
set cursorline 
":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":hi CursorLine   cterm=NONE ctermbg=red ctermfg=white guibg=darkred guifg=white

"set cursorcolumn
":hi CursorColumn ctermfg=red ctermbg=White cterm=bold guifg=white guibg=yellow gui=bold
:hi CursorColumn ctermfg=red ctermbg=White cterm=bold guifg=white guibg=White gui=bold


"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline


"Make :Q! have the same functionality as :q! in vim
:command! -bang Q quit<bang>


"winmanager:
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:NERDTree_title='[NERD Tree]'
let g:winManagerWindowLayout='NERDTree|TagList'

function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
"let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer'
"nnoremap <silent> <F7> :WMToggle<cr>


let g:JSLintHighlightErrorLine = 0


" Folding of (gnu)make output. from http://vim.wikia.com/wiki/Folding_of_gnu_make_output
"au BufReadPost quickfix setlocal foldmethod=marker
"au BufReadPost quickfix setlocal foldmarker=Entering\ directory,Leaving\ directory
"au BufReadPost quickfix map <buffer> <silent> zq zM:g/error:/normal zv<CR>
"au BufReadPost quickfix map <buffer> <silent> zw zq:g/warning:/normal zv<CR>
"au BufReadPost quickfix normal zq
"
"
set mouse=


if has("multi_byte") " UTF-8 编码 
    set encoding=utf-8 
    set termencoding=utf-8 
    set formatoptions+=mM
    set fencs=utf-8,gbk
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
else
    echoerr "对不起，此版本 (g)vim在编译时没有指定支持多字节文本！"
endif

"set nu

"""""tag list 设置
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
"let Tlist_Use_Left_Windo =1                "在左侧窗口中显示taglist窗口
let Tlist_WinWidt =28                   "设置taglist的宽度
let Tlist_Auto_Open = 1  "自动打开taglist

"""""tag list 设置完




""""vundle (vim bundle) 设置 start
"set nocompatible               " be iMproved
filetype off                   " required!       /**  从这行开始，vimrc配置 **/

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" vim toml
Bundle 'cespare/vim-toml'

" My Bundles here:  /* 插件配置格式 */
"   
" original repos on github （Github网站上非vim-scripts仓库的插件，按下面格式填写）
" 状态栏增强插件， airline
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos  （vim-scripts仓库里的，按下面格式填写）
Bundle "taglist.vim"
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos   (非上面两种情况的，按下面格式填写)
"Bundle 'git://git.wincent.com/command-t.git'
" ... 

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo 
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"   
" see :h vundle for more details or wiki for FAQ 
" NOTE: comments after Bundle command are not allowed..

"""" set for python antocomplete
Bundle 'rkulla/pydiction'
let g:pydiction_location = '/Users/huyongde/.vim/third/pydiction/complete-dict'
let g:pydiction_menu_height = 8
"""" end for python 


"""" set for php autocomplete
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'm2mdas/phpcomplete-extended'
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

Bundle 'nrocco/vim-phplint'
"" 写入php文件时，自动进行语法检查
autocmd! BufWritePost *.php :Phplint
" autocmd! BufWritePost *.php :!php -l %

"" 写入php文件时，自动进行代码格式化
autocmd! BufWrite *.php :exec 'normal ggVG==' 
"""  end for php

"""  自动检测vim打开的文件编码
Bundle 'mbbill/fencview' 
let g:fencview_autodetect=1

""""""set for go start
Plugin 'fatih/vim-go'
Bundle 'elgris/hint'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'dgryski/vim-godef'
Plugin 'nsf/gocode', {'rtp': 'vim/'}

""""for markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

filetype plugin indent on     " required!   /** vimrc文件配置结束 **/
"                                           /** vundle命令 **/



""""set for godef
let g:godef_split=3 """打开新窗口的时候左右split
let g:godef_same_file_in_same_window=1 """函数在同一个文件中时不需要打开新窗口

""""set for tagbar start
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }
"""set for tagbar end 

"""set for goimports
let g:go_fmt_command = "goimports"
"""end goimports

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"" 设置markdown不折叠
let g:vim_markdown_folding_disabled = 1
"let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_frontmatter=1 ""set for yaml
let g:vim_markdown_new_list_item_indent = 0
