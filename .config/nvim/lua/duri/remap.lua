vim.g.mapleader = " " 
vim.keymap.set("n", "<leader>pv",vim.cmd.Ex)
vim.keymap.set('n', '<C-a>', '<C-u>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>/', ':nohl<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })


vim.api.nvim_create_user_command('AutoSelectWhitespace', function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)  -- Get the cursor position
    local current_line = vim.api.nvim_get_current_line()  -- Get the current line text
    local cursor_col = cursor_pos[2]  -- Cursor column (0-indexed)

    -- Find the start of the selection
    local start_col = current_line:sub(1, cursor_col):find("%s[%S]*$")
    if not start_col then
        start_col = 1  -- If no whitespace is found before cursor, start at the beginning of the line
    end

    -- Find the end of the selection
    local end_col = current_line:find("%s", cursor_col + 1)
    if not end_col then
        end_col = #current_line + 1  -- If no whitespace is found after cursor, end at the end of the line
    end

    -- Enter visual mode and select the range
    vim.api.nvim_win_set_cursor(0, {cursor_pos[1], start_col - 1})
    vim.cmd('normal! v')
    vim.api.nvim_win_set_cursor(0, {cursor_pos[1], end_col - 1})
end, {})
vim.api.nvim_set_keymap('n', '<leader>w', ':AutoSelectWhitespace<CR>', { noremap = true, silent = true })
