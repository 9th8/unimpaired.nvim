local M = {}
local conf = require 'unimpaired.config'
local functions = require 'unimpaired.functions'
local call_path = "v:lua.require'unimpaired.functions'."

M.register = function()
    local keymaps = conf.options.keymaps
    if not keymaps then return end
    for target, value in pairs(keymaps) do
        if value then
            local mode = 'n'
            if vim.startswith(target, 'exchange_section_') then
                mode = 'x'
            end
            local map = value.mapping or value
            local callback
            local opt = {}
            opt.desc = value.description
            opt.expr = value.dot_repeat
            if functions[target] then
                if value.dot_repeat then
                    callback = function()
                        vim.go.operatorfunc = call_path .. target
                        return 'g@l'
                    end
                else
                    callback = function() functions[target]() end
                end
                vim.keymap.set(mode, map, callback, opt)
            else
                print('Invalid entry in config')
                return
            end
        end
    end
end

return M
