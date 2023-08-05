vim.cmd([[

let g:mkdx#settings     = { 'highlight': { 'enable': 0 },
\ 'enter': { 'shift': 1 },
\ 'links': { 'external': { 'enable': 1 } },
\ 'restore_visual':          1,
\ 'fold': { 'enable': 1 }, 
\ 'checkbox':  { 'toggles': [' ', '-', 'x'],
\                'update_tree': 2,
\                'initial_state': ' ',
\                'match_attrs': {
\                   'mkdxCheckboxEmpty': '',
\                   'mkdxCheckboxPending': '',
\                   'mkdxCheckboxComplete': '',
\                 }, },
\}

let g:mkdx#settings.checkbox.match_attrs = {
\ 'mkdxCheckboxEmpty': 'conceal cchar= ',
\ 'mkdxCheckboxPending': 'conceal cchar= ',
\ 'mkdxCheckboxComplete': 'conceal cchar=  ',
\ }



let g:mkdx#settings = { 'map': { 'prefix': ',' } }

let g:mkdx#settings.tokens.fence = '`'
let g:mkdx#settings.tokens.strike = '~~'
let g:mkdx#settings.tokens.list = '*'

let g:mkdx#settings.highlight.enable = 1
let g:mkdx#defaults.links.conceal= 1


" highlight default link mkdxCheckboxPending  ErrorMsg
" highlight default link mkdxCheckboxComplete ErrorMsg
" highlight default link mkdxCheckboxEmpty    ErrorMsg


nmap <Plug> <Plug>(mkdx-quickfix-toc)
nmap <Plug> <Plug>NetrwBrowseX

" then create a function to remap manually
fun! s:MkdxRemap()
    " regular map family can be used since these are buffer local.
    nmap <buffer><silent> <leader>Q <Plug>(mkdx-quickfix-toc)
    nmap = <Plug>(mkdx-checkbox-next-n)
    nmap - <Plug>(mkdx-checkbox-prev-n)
    " other overrides go here
endfun

" finally, add a "FileType" autocommand that calls "s:MkdxRemap()" upon entering markdown filetype





" let g:mkdx#settings = { 'checkbox': {
"    \ 'match_attrs': {
"    \   'mkdxCheckboxEmpty': 'conceal cchar=1',
"    \   'mkdxCheckboxPending': 'conceal cchar=2',
"    \   'mkdxCheckboxComplete': 'conceal cchar=3',
"    \  } } }






"""""""""""""""""""""""""""" 


fun! s:MkdxGoToHeader(header)
    " given a line: '  84: # Header'
    " this will match the number 84 and move the cursor to the start of that line
    call cursor(str2nr(get(matchlist(a:header, ' *\([0-9]\+\)'), 1, '')), 1)
endfun

fun! s:MkdxFormatHeader(key, val)
    let text = get(a:val, 'text', '')
    let lnum = get(a:val, 'lnum', '')

    " if the text is empty or no lnum is present, return the empty string
    if (empty(text) || empty(lnum)) | return text | endif

    " We can't jump to it if we dont know the line number so that must be present in the outpt line.
    " We also add extra padding up to 4 digits, so I hope your markdown files don't grow beyond 99.9k lines ;)
    return repeat(' ', 4 - strlen(lnum)) . lnum . ': ' . text
endfun

fun! s:MkdxFzfQuickfixHeaders()
    " passing 0 to mkdx#QuickfixHeaders causes it to return the list instead of opening the quickfix list
    " this allows you to create a 'source' for fzf.
    " first we map each item (formatted for quickfix use) using the function MkdxFormatHeader()
    " then, we strip out any remaining empty headers.
    let headers = filter(map(mkdx#QuickfixHeaders(0), function('<SID>MkdxFormatHeader')), 'v:val != ""')

    " run the fzf function with the formatted data and as a 'sink' (action to execute on selected entry)
    " supply the MkdxGoToHeader() function which will parse the line, extract the line number and move the cursor to it.
    call fzf#run(fzf#wrap(
            \ {'source': headers, 'sink': function('<SID>MkdxGoToHeader') }
          \ ))
endfun

" finally, map it -- in this case, I mapped it to overwrite the default action for toggling quickfix (<PREFIX>I)

augroup Mkdx
    au!
    au FileType markdown,mkdx call s:MkdxRemap()
    nnoremap <silent> <Leader>I :call <SID>MkdxFzfQuickfixHeaders()<Cr>
    " source /home/aneeq/.config/lvim/lua/configs/test.vim
augroup END


]])


--         --=============================--------=======================================================

-- vim.cmd([[

-- let g:mkdx#settings = {
-- \ 'image_extension_pattern': 'a\?png\|jpe\?g\|gif',
-- \ 'insert_indent_mappings':  0,
-- \ 'gf_on_steroids':          0,
-- \ 'restore_visual':          1,
-- \ 'enter':                   { 'enable': 1, 'shift': 1, 'o': 1,
-- \                              'shifto': 1, 'malformed': 1 },
-- \ 'map':                     { 'prefix': '<leader>', 'enable': 1 },
-- \ 'tokens':                  { 'enter':  ['-', '*', '>'],
-- \                              'bold':   '**', 'italic': '*',
-- \                              'strike': '',
-- \                              'list':   '-',  'fence':  '',
-- \                              'header': '#' },
-- \ 'checkbox':                { 'toggles': [' ', '-', 'x'],
-- \                              'update_tree': 2,
-- \                              'initial_state': ' ',
-- \                              'match_attrs': {
-- \                                 'mkdxCheckboxEmpty': '',
-- \                                 'mkdxCheckboxPending': '',
-- \                                 'mkdxCheckboxComplete': '',
-- \                               }, },
-- \ 'toc':                     { 'text':       "TOC",
-- \                              'list_token': '-',
-- \                              'position':   0,
-- \                              'update_on_write':   0,
-- \                              'details':    {
-- \                                 'enable':  0,
-- \                                 'summary': '{{toc.text}}'
-- \                                 'nesting_level': -1,
-- \                                 'child_count': 5,
-- \                                 'child_summary': 'show {{count}} items'
-- \                              }
-- \                            },
-- \ 'table':                   { 'divider': '|',
-- \                              'header_divider': '-',
-- \                              'align': {
-- \                                 'left':    [],
-- \                                 'right':   [],
-- \                                 'center':  [],
-- \                                 'default': 'center'
-- \                              }
-- \                            },
-- \ 'links':                   { 'external': {
-- \                                 'enable':     1,
-- \                                 'timeout':    3,
-- \                                 'host':       '',
-- \                                 'relative':   1,
-- \                                 'user_agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/9001.0.0000.000 vim-mkdx/1.10.0'
-- \                              },
-- \                              'fragment': {
-- \                                 'jumplist': 1,
-- \                                 'complete': 1
-- \                              },
-- \                              'conceal': 1
-- \                            },
-- \ 'highlight':               {
-- \                              'enable': 0,
-- \                              'frontmatter': {
-- \                                'yaml': 1,
-- \                                'toml': 0,
-- \                                'json': 0
-- \                              }
-- \                            },
-- \ 'auto_update':             { 'enable': 1 },
-- \ 'fold':                    { 'enable': 0, 'components': ['toc', 'fence'] }
-- \ }

-- ]])
