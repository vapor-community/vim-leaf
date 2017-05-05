" Vim syntax file
" " Language: Leaf Additions
" " Maintainer: Brett Toomey <brettcwx@gmail.com>
" " Contributor: Brett Toomey <brettcwx@gmail.com>
" " Last Change: 5 May 2017
" " Version: 0.0

runtime! syntax/html.vim
unlet b:current_syntax

if exists("b:current_syntax")
    finish
endif

syn match leafFunc skipwhite nextgroup=leafParam containedin=@htmlLeafContainer
      \ /\(#\+\([A-Za-z_][A-Za-z_0-9]*\)*\)\%((\)\@=/

syn match leafIdentifiers contained skipwhite containedin=@htmlLeafContainer
      \ /[A-Za-z_][A-Za-z_0-9]*/

syn region leafString start=/"/ end=/"/ contains=leafFunc keepend containedin=TOP,@htmlLeafContainer

syn region leafParam contained contains=leafIdentifiers,leafString containedin=@htmlLeafContainer
      \ matchgroup=Delimiter start="(" end=")" matchgroup=NONE skip=","

syn match leafParamDelim contained containedin=@htmlLeafContainer
      \ /,/

syntax cluster htmlLeafContainer add=htmlHead,htmlTitle,htmlString,htmlH1,htmlH2,htmlH3,htmlH4,htmlH5,htmlH6,htmlLink,htmlBold,htmlUnderline,htmlItalic,htmlValue

hi def link leafFunc Function
hi def link leafIdentifiers Type
hi def link leafString String

let b:current_syntax = "leaf"
