--

function virtual_text_toggle()
    vim.g.diagnostic_virtual_text = not vim.g.diagnostic_virtual_text
    vim.diagnostic.config({virtual_text=vim.g.diagnostic_virtual_text})
end

function virtual_lines_toggle()
    vim.g.diagnostic_virtual_lines = not vim.g.diagnostic_virtual_lines
    vim.diagnostic.config({virtual_lines=vim.g.diagnostic_virtual_lines})
end
vim.cmd [[ command! VirtualTextToggle lua virtual_text_toggle()]]

vim.cmd([[
function GetURLTitle(url)
    " Bail early if the url obviously isn't a URL.
    if a:url !~ '^https\?://'
        return ""
    endif

    " Use Python/BeautifulSoup to get link's page title.
    let title = system("python3 -c \"import bs4, requests; print(bs4.BeautifulSoup(requests.get('" . a:url . "').content, 'lxml').title.text.strip())\"")

    " Echo the error if getting title failed.
    if v:shell_error != 0
        echom title
        return ""
    endif

    " Strip trailing newline
    return substitute(title, '\n', '', 'g')
endfunction

function PasteMDLink()
    let url = getreg("+")
    let title = GetURLTitle(url)
    let mdLink = printf("[%s](%s)", title, url)
    execute "normal! a" . mdLink . "\<Esc>"
endfunction

" Make a keybinding (mnemonic: "mark down paste")
nmap ,mdp :call PasteMDLink()<cr>

]])



vim.cmd([[


function FetchURLTitle()
    let line = getline('.')
    let match = matchstr(line, '\vhttp[s]?://\S+')
    if match == ''
        return ''
    endif

    let title = substitute(system("python3 -c \"import bs4, requests; print(bs4.BeautifulSoup(requests.get('" . match . "').content, 'lxml').title.text.strip())\""), '\n', '', 'g')
    let cleanedTitle = substitute(title, '\x00', '', 'g')

    if v:shell_error != 0
        echom cleanedTitle
        return ''
    endif

    let mdLink = printf("[%s](%s)", cleanedTitle, match)
    let modifiedLine = substitute(line, '\vhttp[s]?://\S+', mdLink, '')
    call setline('.', modifiedLine)
    return ''
endfunction

function ReplaceLinkWithMDLink()
    let savedReg = getreg('"')
    normal! "ayiw
    call FetchURLTitle()
    let formattedLink = getreg('"')
    let formattedLink = substitute(formattedLink, '\n', '', 'g')
    call setreg('+', formattedLink)
    call setreg('"', savedReg)
endfunction

" Make a keybinding (mnemonic: "replace link with MD link")
nmap ,mrl :call ReplaceLinkWithMDLink()<CR>



]])

function AddWorkspaceFolder()
  -- Assuming you have already set up the Language Server Protocol (LSP) in Neovim
    vim.lsp.buf.add_workspace_folder()
end
