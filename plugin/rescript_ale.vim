call ale#Set('rescript_lsp_js_file', '~/.vim/plugged/vim-rescript/server/out/server.js')

" Give vim-ale the rescript executable to check because the LSP server is
" a non-executable JS file
call ale#Set('rescript_executable', 'rescript')
call ale#Set('rescript_use_global', get(g:, 'ale_use_global_executables', 1))


function! rescript_ale#GetRootDir(buffer) abort
    let l:config = ale#path#FindNearestFile(a:buffer, 'bsconfig.json')

    return !empty(l:config) ? fnamemodify(l:config, ':p:h') : ''
endfunction

function! FormatRescript(buffer) abort
  return {
  \   'command': 'rescript format %t',
  \   'read_temporary_file': 1,
  \}
endfunction

call ale#fix#registry#Add('rescript', 'FormatRescript', ['rescript'], 'rescript formatter')

call ale#linter#Define('rescript', {
\   'name': 'rescript',
\   'lsp': 'stdio',
\   'executable': {b -> ale#node#FindExecutable(b, 'rescript', [
\       'node_modules/.bin/rescript',
\       'rescript'
\   ])},
\   'command': {b -> 'node ' . ale#Var(b, 'rescript_lsp_js_file') . ' --stdio'},
\   'project_root': function('rescript_ale#GetRootDir'),
\   'language': 'rescript',
\})
