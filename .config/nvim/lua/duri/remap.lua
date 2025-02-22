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

function escape_pattern(str)
    return str:gsub("([%.%-%+%*%?%[%]%^%$%(%)%.%|%&])", "%%%1")
end
local comment_notations = {
    cpp = "//",         -- C, C++, Java
    python = "#",       -- Python
    javascript = "//",  -- JavaScript
    lua = "--",         -- Lua
    ruby = "#",         -- Ruby
    go = "//",          -- Go
}
function get_comment_delimiter()
    local filetype = vim.bo.filetype
    -- print(comment_notations[filetype] or "//")
    return comment_notations[filetype] or "//"  -- Default to "//" if not found
end
vim.api.nvim_set_keymap('n', '<leader>c', ':lua DeleteTrailingComment()<CR>', { noremap = true, silent = true })

function DeleteTrailingComment()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)  -- Get cursor position: {line, column}
    local current_line = vim.api.nvim_get_current_line()  
    local cursor_col = cursor_pos[2]

    local comment_delim = get_comment_delimiter()

    local escaped_comment_delim = escape_pattern(comment_delim)

    local start_col = current_line:find(escaped_comment_delim)

    if start_col then
        -- Find the last space character before the comment delimiter
        local space_before_comment = current_line:sub(1, start_col - 1):match(".*%s()")
        -- print(space_before_comment .. start_col)
        -- If a space exists, include it in the selection, else start directly at the comment
        local selection_start = (space_before_comment or start_col) - 1

        -- Enter visual mode at the start of the comment (or the space before it)
        vim.api.nvim_win_set_cursor(0, {cursor_pos[1], selection_start})
        vim.cmd('normal! v')  -- Start visual mode

        -- Move to the end of the line
        vim.api.nvim_win_set_cursor(0, {cursor_pos[1], #current_line -1})
        vim.cmd('normal! d')  -- Delete the selection
    else
        print("No comment delimiter found.")
    end

end
vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xw', '<cmd>Trouble workspace_diagnostics<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xd', '<cmd>Trouble document_diagnostics<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xl', '<cmd>Trouble loclist<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', { noremap = true, silent = true })




