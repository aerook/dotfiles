let g:acp_enableAtStartup = 1
let g:neocomplete#enable_at_startup = 1

map <leader>gr <Plug>(go-run)
map <leader>gb <Plug>(go-build)
map <leader>gt <Plug>(go-test)
map <leader>gc <Plug>(go-coverage)

map <leader>f <Plug>(go-def-split)
map <leader>F <Plug>(go-def-vertical)
map <leader>gdt <Plug>(go-def-tab)

map <leader>gd <Plug>(go-doc)
map <leader>gv <Plug>(go-doc-vertical)

map <Leader>i <Plug>(go-implements)
map <leader>gs <Plug>(go-implements)
map <leader>gi <Plug>(go-info)
map <leader>ge <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
