nnoremap <leader>ccd :call jukit#cells#delete()<cr>
"   - Delete current cell
let g:jukit_mappings = 1
let g:jukit_pdf_viewer = "okular"
fun! PythonHelp()
    let visual_selection = jukit#util#get_visual_selection()
    let cmd = 'help(' . visual_selection . ')'
    call jukit#send#send_to_split(cmd)
endfun
" === === === === === === === === === === === === === === === === === === === === === ===
" jukit
let g:jukit_terminal = ''
let g:jukit_auto_output_hist = 0
let g:jukit_use_tcomment = 0
let g:jukit_comment_mark = '#'
let g:jukit_mappings = 1
" let g:jukit_mappings_ext_enabled = 
let g:jukit_convert_overwrite_default = -1
let g:jukit_convert_open_default = -1
let g:jukit_file_encodings = 'utf-8'
" === === === === === === === === === === === === === === === === === === === === === ===
" hightlight
let g:jukit_highlight_markers = 1
let g:jukit_enable_textcell_bg_hl = 1
let g:jukit_enable_textcell_syntax = 1
let g:jukit_text_syntax_file = $VIMRUNTIME . '/syntax/' . 'markdown.vim'
let g:jukit_hl_ext_enabled = '*'
" === === === === === === === === === === === === === === === === === === === === === ===
" kitty
let g:jukit_output_bg_color = get(g:, 'jukit_output_bg_color', '')
let g:jukit_output_fg_color = get(g:, 'jukit_output_fg_color', '')
let g:jukit_outhist_bg_color = get(g:, 'jukit_outhist_bg_color', '#090b1a')
let g:jukit_outhist_fg_color = get(g:, 'jukit_outhist_fg_color', 'gray')
let g:jukit_output_new_os_window = 0
let g:jukit_outhist_new_os_window = 0
" === === === === === === === === === === === === === === === === === === === === === ===
" ipython
let g:jukit_in_style = 2
let g:jukit_max_size = 20
let g:jukit_show_prompt = 0
let g:jukit_save_output = 1
let g:jukit_save_output = 0
let g:jukit_clean_outhist_freq = 60 * 10
" === === === === === === === === === === === === === === === === === === === === === ===
" matplotlib
let g:jukit_savefig_dpi = 150
let g:jukit_mpl_block = 1
let g:jukit_custom_backend = -1
let g:jukit_mpl_style = jukit#util#plugin_path() . '/helpers/matplotlib-backend-kitty/backend.mplstyle'
let g:jukit_mpl_style = ''
let g:jukit_inline_plotting = 1
let g:jukit_inline_plotting = 0

" === === === === === === === === === === === === === === === === === === === === === ===
" ueberzug

let g:jukit_hist_use_ueberzug = 0
let g:jukit_ueberzug_use_cached = 1
let g:jukit_ueberzug_pos = [0.25, 0.25, 0.4, 0.6]
let g:jukit_ueberzug_pos_noout = [0.25, 0.25, 0.4, 0.6]
let g:jukit_kill_ueberzug_on_focus_lost = 1
let g:jukit_ueberzug_border_color = get(g:, 'jukit_ueberzug_border_color', 'blue')
let g:jukit_ueberzug_theme = 'dark'
let g:jukit_ueberzug_term_hw_ratio = -1
let g:jukit_ueberzug_python_cmd = 'python3'
let g:jukit_ueberzug_jupyter_cmd = 'jupyter'
let g:jukit_ueberzug_cutycapt_cmd = 'cutycapt'
let g:jukit_ueberzug_imagemagick_cmd = 'convert'
