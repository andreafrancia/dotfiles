augroup elixir
  autocmd!
  autocmd FileType elixir
    \ let b:endwise_addition = 'end' |
    \ let b:endwise_words = ''
      \ . 'def,'
      \ . 'defmodule,'
      \ . 'case,'
      \ . 'cond,'
      \ . 'bc,'
      \ . 'lc,'
      \ . 'inlist,'
      \ . 'inbits,'
      \ . 'if,'
      \ . 'unless,'
      \ . 'try,'
      \ . 'receive,'
      \ . 'function,'
      \ . 'fn'
      \ |
    \ let b:endwise_pattern = ''
      \ . '^\s*\zs\%('
        \ . 'def\|'
        \ . 'defmodule\|'
        \ . 'case\|'
        \ . 'cond\|'
        \ . 'bc\|'
        \ . 'lc\|'
        \ . 'inlist\|'
        \ . 'inbits\|'
        \ . 'if\|'
        \ . 'unless\|'
        \ . 'try\|'
        \ . 'receive\|'
        \ . 'function\|'
        \ . 'fn'
      \ . '\)\>\%(.*[^:]\<end\>\)\@!'
      \ |
    \ let b:endwise_syngroups = ''
      \ . 'elixirDefine,'
      \ . 'elixirModuleDefine,'
      \ . 'elixirKeyword'
augroup END
