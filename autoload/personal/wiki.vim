function! personal#wiki#link_resolver(url) abort
  let l:url = deepcopy(a:url)

  let l:url.anchor = wiki#url#utils#extract_anchor(l:url.stripped)

  let l:path = split(l:url.stripped, '#', 1)[0]
  let l:url.path = personal#wiki#path_resolver(l:path, l:url.origin)

  return l:url
endfunction

function! personal#wiki#path_resolver(filename, origin) abort
  if empty(a:filename) | return a:origin | endif

  let l:path = wiki#paths#s(wiki#get_root() . '/' . a:filename)

  if l:path =~# '/$'
    let l:path .= g:wiki_index_name
  endif

  return wiki#url#utils#add_extension(l:path)
endfunction
