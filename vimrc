
syntax on

filetype plugin on

""  设置vim最下面的状态栏，显示文件信息
function! InsertStatuslineColor(mode)

    if a:mode == 'i'

        hi statusline guibg=peru

    elseif a:mode == 'r'

        hi statusline guibg=blue

    else

        hi statusline guibg=black

    endif

endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)

au InsertLeave * hi statusline guibg=orange guifg=white

hi statusline guibg=black
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\[HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\[POS=%l,%v][%p%%]\ [LEN=%L]

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
"inoremap mm    <ESC>

""Normal|Insert Mode下，",dt" 在当前光标后面添加日期时间
nmap ,dt a<C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR>
imap ,dt <C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR>

" search
set hlsearch "" highlight search 
set incsearch "" 增量搜索
set ignorecase "" 不区分大小写

set mouse=
set showmatch

""设置搜索高亮的模式
highlight Search ctermfg=Black ctermbg=green cterm=bold

" set tab stop
set tabstop=4
set shiftwidth=4
set expandtab

set autoindent
set smartindent
set cindent

" Always keep 20 lines above and below the cursor if possible
set scrolloff=20

"highlight current
set cursorline 
":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":hi CursorLine   cterm=NONE ctermbg=red ctermfg=white guibg=darkred guifg=white

"set cursorcolumn
":hi CursorColumn ctermfg=red ctermbg=White cterm=bold guifg=white guibg=yellow gui=bold
:hi CursorColumn ctermfg=red ctermbg=White cterm=bold guifg=white guibg=White gui=bold


set encoding=utf-8
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8

set fenc=utf-8
"set fileencodings=utf-8,gb18030,utf-16,big5
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8




set nocompatible               " be iMproved
filetype off                   " required!

"set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" My Bundles here:
"
" original repos on github 
"Bundle 'tpope/vim-fugitive' 
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" " vim-scripts repos
""如果插件来自 vim-scripts，你直接写插件名就行了
"Bundle 'L9'
"Bundle 'FuzzyFinder'
 " non github repos
"如使用自己的git库的插件，像下面这样做
"Bundle 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
 " ...


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
"autocmd! BufWrite *.php :exec 'normal ggVG==' 
"""  end for php

"""  自动检测vim打开的文件编码
Bundle 'mbbill/fencview' 
let g:fencview_autodetect=1

""""""set for go start
Plugin 'fatih/vim-go'
Bundle 'elgris/hint'
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

filetype plugin indent on     " required!
"下面是 vundle的一些命令代会会用到
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed.


"set nu

"""""tag list 设置
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
"let Tlist_Use_Left_Windo =1                "在左侧窗口中显示taglist窗口
let Tlist_WinWidt =28                   "设置taglist的宽度
let Tlist_Auto_Open = 0  "自动打开taglist
let Tlist_Process_File_Always=1 "实时更新tags

"""""tag list 设置完
