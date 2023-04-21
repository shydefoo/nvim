local wk = require("which-key")
local func = require("core.functions")
wk.register({
	-- coc mappings
	j = {
		name = "coc", -- optional group name
		d = { "<Plug>(coc-definition)", "Jump to definition" },
		t = { "<Plug>(coc-type-definition)", "Jump to type" },
		r = { "<Plug>(coc-references)", "Jump to references" },
		n = { "<Plug>(coc-diagnostic-next-error)", "Jump to next error" },
		p = { "<Plug>(coc-diagnostic-prev-error)", "Jump to previous error" },
	},
}, { prefix = "<leader>", noremap = false })

wk.register({
	-- nvim-tree key-bindings
	n = {
		name = "file", -- optional group name
		n = { "<cmd>NvimTreeToggle<cr>", "Toggle nvim tree" },
		f = { "<cmd>NvimTreeFindFileToggle<cr>", "Find file in tree" },
	},
	-- ale mappings
	a = {
		name = "ale",
		x = { "<cmd>ALEFix<cr>", "Ale Fix" },
		l = { "<cmd>ALELint<cr>", "Ale lint" },
	},
	f = {
		name = "Files",
		-- g = { "<cmd>Telescope live_grep<cr>", "live grep" },
		b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
	},
}, { prefix = "<leader>", silent = true })

-- wk.register({
-- 	["<Tab>"] = { '<expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\\<Tab>"' },
-- }, { mode = "i" })

-- TODO: Figure out how to replace this with whichkey
vim.cmd([[
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
]])

-- yank stack mappings
-- wk.register({
-- 	["<C-p>"] = { "<Plug>yankstack_substitute_older_paste" },
-- 	["<C-n>"] = { "<Plug>yankstack_substitute_newer_paste" },
-- }, { noremap = false })
vim.cmd([[
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste
]])

-- git signs mapping
vim.keymap.set("n", "<leader>d", "<cmd>Gitsigns toggle_signs<cr>", { silent = true })
vim.keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", { silent = true })
vim.keymap.set("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", { silent = true })
vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns preview_hunk_inline<cr>", { silent = true })
vim.keymap.set("n", "<leader>hx", "<cmd>Gitsigns reset_hunk<cr>", { silent = true })

-- coc-snippets
vim.cmd([[
let g:coc_snippet_next = '<C-l>'
let g:coc_snippet_prev = '<C-h>'
]])

function COC_VISUAL_REPLACE()
	local text = func.get_visual_selection()
	local command = "CocSearch " .. text
	vim.cmd(command)
end
vim.keymap.set("v", "<leader>r", [[:<C-u>call v:lua.COC_VISUAL_REPLACE()<CR>]])

vim.cmd([[
  nnoremap <silent> K :call ShowDocumentation()<CR>
  " Show hover when provider exists, fallback to vim's builtin behavior.
  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('definitionHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction
]])

-- https://github.com/nvim-telescope/telescope.nvim/issues/814#issuecomment-1238510694
vim.cmd([[
function!   QuickFixOpenAll()
    if empty(getqflist())
        return
    endif
    let s:prev_val = ""
    for d in getqflist()
        let s:curr_val = bufname(d.bufnr)
        if (s:curr_val != s:prev_val)
            exec "edit " . s:curr_val
        endif
        let s:prev_val = s:curr_val
    endfor
endfunction
]])

vim.api.nvim_set_keymap("n", "<leader>ka", ":call QuickFixOpenAll()<CR>", { noremap = true, silent = false })
