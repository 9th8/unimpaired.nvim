local M = {}

-- Dot repetition of a custom mapping breaks as soon as there is a dot repeatable normal
-- mode command inside the mapping. This function restores the dot repetition of
-- the mapping while preserving the [count] when called as last statement inside
-- the custom mapping
local restore_dot_repetition = function(count)
    count = count or ''
    local callback = vim.go.operatorfunc
    vim.go.operatorfunc = ''
    vim.cmd('silent! normal ' .. count .. 'g@l')
    vim.go.operatorfunc = callback
end

M.blank_above = function()
    local repeated = vim.fn["repeat"]({""}, vim.v.count1)
    local line = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, line-1, line-1, true, repeated)
end

M.blank_below = function()
    local repeated = vim.fn["repeat"]({""}, vim.v.count1)
    local line = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, line, line, true, repeated)
end

M.exchange_above = function()
    local count = vim.v.count1
    vim.cmd('silent! move --' .. count)
    vim.cmd.normal('==')
    restore_dot_repetition(count)
end

M.exchange_below = function()
    local count = vim.v.count1
    vim.cmd('silent! move +' .. count)
    vim.cmd.normal('==')
    restore_dot_repetition(count)
end

M.exchange_section_above = function()
    local count = vim.v.count1
    vim.cmd("silent! '<,'>move '<--" .. count)
    vim.cmd.normal('gv=')
    restore_dot_repetition(count)
end

M.exchange_section_below = function()
    local count = vim.v.count1
    vim.cmd("silent! '<,'>move '>+" .. count)
    vim.cmd.normal('gv=')
    restore_dot_repetition(count)
end

return M
