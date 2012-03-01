" NEW BSD LICENSE {{{
" Copyright (c) 2012, anekos.
" All rights reserved.
" 
" Redistribution and use in source and binary forms, with or without modification,
" are permitted provided that the following conditions are met:
" 
"     1. Redistributions of source code must retain the above copyright notice,
"        this list of conditions and the following disclaimer.
"     2. Redistributions in binary form must reproduce the above copyright notice,
"        this list of conditions and the following disclaimer in the documentation
"        and/or other materials provided with the distribution.
"     3. The names of the authors may not be used to endorse or promote products
"        derived from this software without specific prior written permission.
" 
" THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
" ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
" WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
" IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
" INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
" BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
" DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
" LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
" OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
" THE POSSIBILITY OF SUCH DAMAGE.
" 
" 
" ###################################################################################
" # http://sourceforge.jp/projects/opensource/wiki/licenses%2Fnew_BSD_license       #
" # に参考になる日本語訳がありますが、有効なのは上記英文となります。                #
" ###################################################################################
" 
" }}}

scriptencoding utf-8

let s:runes = {
\   'german': {
\     'f': 'ᚠ',
\     'u': 'ᚢ',
\     'T': 'ᚦ',
\     'a': 'ᚫ',
\     'r': 'ᚱ',
\     'k': 'ᚲ',
\     'g': 'ᚷ',
\     'w': 'ᚹ',
\     'h': 'ᚺ',
\     'n': 'ᛅ',
\     'i': 'ᛁ',
\     'j': 'ᛃ',
\     'I': 'ᛇ',
\     'p': 'ᛈ',
\     'z': 'ᛉ',
\     'R': 'ᛉ',
\     's': 'ᛊ',
\     't': 'ᛏ',
\     'b': 'ᛒ',
\     'e': 'ᛖ',
\     'm': 'ᛗ',
\     'l': 'ᛚ',
\     'N': 'ᛜ',
\     'o': 'ᛟ',
\     'd': 'ᛞ'
\   },
\   'anglosaxon': {
\     'f': 'ᚠ',
\     'u': 'ᚢ',
\     'T': 'ᚦ',
\     'o': 'ᚩ',
\     'r': 'ᚱ',
\     'c': 'ᚳ',
\     'g': 'ᚷ',
\     'w': 'ᚹ',
\     'h': 'ᚻ',
\     'n': 'ᚾ',
\     'i': 'ᛁ',
\     'j': 'ᚼ',
\     'I': 'ᛇ',
\     'p': 'ᛈ',
\     'x': 'ᛉ',
\     's': 'ᛋ',
\     'S': 'ᚴ',
\     't': 'ᛏ',
\     'b': 'ᛒ',
\     'e': 'ᛖ',
\     'm': 'ᛗ',
\     'l': 'ᛚ',
\     'N': 'ᛝ',
\     'O': 'ᛟ',
\     'd': 'ᛞ',
\     'a': 'ᚪ',
\     'A': 'ᚨ',
\     'y': 'ᚣ',
\     'E': 'ᛠ',
\     'G': 'ᚸ',
\     'k': 'ᛣ',
\     'K': 'ᛤ'
\   },
\   'denmark': {
\     'f': 'ᚠ',
\     'u': 'ᚢ',
\     'T': 'ᚦ',
\     'o': 'ᚭ',
\     'r': 'ᚱ',
\     'k': 'ᚴ',
\     'h': 'ᚼ',
\     'n': 'ᚾ',
\     'i': 'ᛁ',
\     'a': 'ᛅ',
\     's': 'ᛋ',
\     't': 'ᛏ',
\     'b': 'ᛒ',
\     'm': 'ᛉ',
\     'l': 'ᛚ',
\     'R': 'ᛣ'
\   },
\   'sweden': {
\     'f': 'ᚠ',
\     'u': 'ᚢ',
\     'T': 'ᚦ',
\     'o': 'ᚭ',
\     'O': 'ᚮ',
\     'r': 'ᚱ',
\     'k': 'ᚴ',
\     'h': 'ᚽ',
\     'n': 'ᚿ',
\     'i': 'ᛁ',
\     'a': 'ᛆ',
\     's': 'ᛍ',
\     't': 'ᛐ',
\     'b': 'ᛓ',
\     'm': 'ᛙ',
\     'l': 'ᛚ',
\     'R': 'ᛧ'
\   }
\}
" G: N -> ng, T -> th



let s:rune_name = "german"

function! s:runes(name, char)
  let l:table = s:runes[a:name]
  if has_key(l:table, a:char)
    return l:table[a:char]
  endif
  return a:char
endfunction

function! s:toggle(...)
  if !exists('b:anekos_runes_enabled')
    let b:anekos_runes_enabled = 0
  endif

  if a:0 > 0 && a:1 != ""
    if !has_key(s:runes, a:1)
      echoerr "Unknown rune: " . a:1
      return
    endif
    let s:rune_name = a:1
    let b:anekos_runes_enabled = 1
  else
    let b:anekos_runes_enabled = !b:anekos_runes_enabled
  endif

  if b:anekos_runes_enabled
    augroup anekos_runes
      autocmd!
      autocmd InsertCharPre <buffer> let v:char = s:runes(s:rune_name, v:char)
    augroup END
    echomsg "Rune Input Mode: on (" . s:rune_name . ")"
  else
    autocmd! anekos_runes
    echomsg "Rune Input Mode: off"
  endif
endfunction

function! s:rune_name_completer(arg_lead, command_line, cursor_pos)
  return "german\nanglosaxon\ndenmark\nsweden"
endfunction

command! -nargs=? -complete=custom,<SID>rune_name_completer Runes call <SID>toggle(<q-args>)

inoremap <Plug>(anekos_runes_toggle) <C-o>:call <SID>toggle()<CR>
inoremap <Plug>(anekos_runes_toggle_german) <C-o>:call <SID>toggle("german")<CR>
inoremap <Plug>(anekos_runes_toggle_anglosaxon) <C-o>:call <SID>toggle("anglosaxon")<CR>
