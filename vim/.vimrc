""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Basic setting                           "
"                                                              "
"                                                              "
"                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible    "关闭vi兼容

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set autoindent      " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
set smartindent     " 智能对齐方式
set cindent         " 使用 C/C++ 语言的自动缩进方式
"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s   "设置C/C++语言的具体缩进方式

set nu

syntax enable
syntax on
colorscheme desert
"set background=dark    "设置背景颜色


set laststatus=2 " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set ruler " 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。
set previewwindow " 标识预览窗口

set showcmd " 命令行显示输入的命令
set showmode " 命令行显示vim当前模式

set incsearch " 输入字符串就显示匹配点
set hlsearch

" Taglist Settings
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
"let Tlist_Sort_Type = "name"           "以tag名字进行排序，缺省是按tag在文件中出现的顺序进行排序
let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist窗口时，输入焦点在taglist窗口中

"set showmatch " 设置匹配模式，显示匹配的括号
"set linebreak " 整词换行
"set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去

"set paste    "设置在粘贴的时候不自动缩进

" ----------------------------------------->
" fileencoding  : 磁盘文件的字符编码
" fileencodings : VIM逐一测试fileencodings变量指定的字符编码方式，
"            直到找到认为合适的然后把这种字符编码方式设置为fileencoding变量。
" encoding      : VIM缓冲区以及界面的字符编码
" termencoding  : 终端使用的字符编码
"
" VIM涉及到的3种字符编码之间的转换： 
" 读：fileencoding —–> encoding 
" 显：encoding     ——> termencoding 
" 写：encoding     ——> fileencoding
" <-----------------------------------------
"set encoding=gb2312
"set termencoding=gb2312
"set fileencodings=gb2312,latin1,big5,cp936,gb18030,gb2312,utf-8,utf-16
"set fileencoding=gb2312


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Keys Mapping                            "
"                                                              "
"                                                              "
"                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ';'

inoremap <leader>' ''<ESC>i
inoremap <leader>" ""<ESC>i
inoremap <leader>( ()<ESC>i
inoremap <leader>[ []<ESC>i
inoremap <leader>{ {}<ESC>i
inoremap <leader>< <><ESC>i


nnoremap <F3> :NERDTreeMirror<CR>
nnoremap <F3> :NERDTreeToggle<CR>

nnoremap <F9> :TlistToggle<CR>

noremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
noremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
noremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
noremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
noremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
noremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
noremap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
noremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Abbreviation                            "
"                                                              "
"                                                              "
"                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbrev ;b {}<esc>i<cr><cr><esc>ki<tab>
"iabbrev if( if<space>()<space>{}<esc>i<cr><cr><esc>kki
