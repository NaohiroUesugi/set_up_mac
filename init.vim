set expandtab " Tabを半角入力に
set tabstop=2 " Tab space2個(行頭以外)
set shiftwidth=2 " Tab space2個(行頭)
set autoindent " 改行した時にインデントを揃えてくれる
set backspace=indent,eol,start
set showmatch " 閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプする
set autoread " 編集中のファイルが変更されたら自動で読み直す
set visualbell t_vb= " ビープ音を止めて画面も点滅させない
set clipboard+=unnamed
set mouse=a
" set pyxversion=3

set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

""" -------------------------------------
""" 見た目関連
""" ------------------------------------
set number " 行番号を表示
set laststatus=2 " ステータスを表示(0: 表示しない, 1: ウインドウ数が2以上の時, 2: 常に表示)
syntax on " シンタックスハイライトを有効にする
set wildmenu " 補完を表示してくれる
set showcmd
set background=dark
" set cursorline " カーソルがある場所を表示してくれるが描画が遅くなるようだ
" set cursorcolumn



""" 検索関連
""" ------------------------------------
set hlsearch " 検索時にハイライト
set ignorecase " 検索時に大文字と小文字を区別しない
set incsearch " リアルタイムで検索
set smartcase " 大文字で検索した場合に検索を区別する

""" -------------------------------------
""" 削除でyankしない
""" ------------------------------------
nnoremap x "_x
nnoremap dd "_dd
nnoremap diw "_diw

""" -------------------------------------
""" dein.vim
""" 追加した後 :call dein#install() 必要
""" ------------------------------------
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('junegunn/fzf', {'build': './install --all'})
  call dein#add('junegunn/fzf.vim')
  call dein#add('mhinz/vim-startify')
  call dein#add('tpope/vim-commentary')
  call dein#add('dense-analysis/ale')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('peitalin/vim-jsx-typescript')
  call dein#add('simeji/winresizer')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('itchyny/lightline.vim')
  call dein#add('pechorin/any-jump.vim')
  
  " call dein#add('sheerun/vim-polyglot', {'merged': 0})
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
 call dein#install()
endif

""" call dein#install()を自動でする
"if dein#check_install()
"  call dein#install()
"endif

filetype plugin indent on
syntax enable

let mapleader = "\<Space>"

""" -------------------------------------
""" NERDTree
""" ------------------------------------
function NerdFindToggle()
    if &filetype == 'nerdtree'
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction
nnoremap <leader>e :call NerdFindToggle()<CR>

""" -------------------------------------
""" fzf
""" ------------------------------------
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir GitFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <C-g> :exec 'Rg' expand('<cword>')<CR>
nnoremap <leader>/ :Rg<Space>
nnoremap <leader>p :GitFiles<CR>
nnoremap <leader>b :Buffers<CR>

""" -------------------------------------
""" ale
""" ------------------------------------
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript.jsx': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\}


"""""""""""""""""""""""""""""""""
" polyglot
""""""""""""""""""""""""""""""""
" let g:polyglot_disabled = ['csv', 'styled-components']


""" -------------------------------------
""" startify
""" ------------------------------------
let g:startify_files_number = 5
let g:startify_list_order = [
        \ ['recent files:'],
        \ 'files',
        \ [' recent files /dir:'],
        \ 'dir',
        \ ['sessions'],
        \ 'sessions',
        \ ['bookmarks:'],
        \ 'bookmarks',
        \ ]
let g:startify_bookmarks = ["~/.config/nvim/init.vim", "~/.gvimrc"]

function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = s:center([
    \'             _    ___',
    \'            | |  / (_)___ ___',
    \'            | | / / / __ `__ \',
    \'            | |/ / / / / / / /',
    \'            |___/_/_/ /_/ /_/',
    \ ])


""" ===================================
""" vim-jsx-typescript
""" ===================================
" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

""" ===================================
"""   vim-indent-guides
""" ===================================
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify', 'terminal', 'fzf']


""" ===================================
"""   deoplete
""" ===================================
let g:deoplete#enable_at_startup = 1

""" ===================================
"""  any-jump
""" ===================================
nnoremap <leader>gd :AnyJump<CR>
nnoremap <leader>gb :AnyJumpBack<CR>
xnoremap <leader>j :AnyJumpVisual<CR>
nnoremap <leader>al :AnyJumpLastResults<CR>
let g:any_jump_disable_default_keybindings = 1
let g:any_jump_list_numbers = 0
let g:any_jump_references_enabled = 1
let g:any_jump_search_prefered_engine = 'rg'
hi Pmenu guibg=#1b1b1b ctermbg=23
