local M = {}
M.status = "idle"

-- For iterating over quickfixlist you can use neovim default key bindings:
-- - :cnext ]q
-- - :cprev [q
-- - :cfirst
-- - :clast
-- - :copen
-- - :cclose


-- Define the signs for error and warning
vim.fn.sign_define('make_status_error', {text = 'E', texthl = 'Error', linehl = '', numhl = ''})
vim.fn.sign_define('make_status_warning', {text = 'W', texthl = 'Warning', linehl = '', numhl = ''})

-- Table to track placed signs
M.placed_signs = {}

-- Function to update signs for quickfix entries
function M.update_signs()
    local qflist = vim.fn.getqflist()
    local new_signs = {}

    for _, entry in ipairs(qflist) do
        if entry.bufnr ~= 0 and entry.lnum ~= 0 then
            local key = entry.bufnr .. ":" .. entry.lnum
            new_signs[key] = entry
        end
    end

    -- Remove old signs that are no longer in the quickfix list
    for key, sign in pairs(M.placed_signs) do
        if not new_signs[key] then
            vim.fn.sign_unplace("my_namespace", { buffer = sign.bufnr })
        end
    end

    -- Clear the tracking table
    M.placed_signs = {}

    -- Place new signs
    for key, entry in pairs(new_signs) do
        local sign_name = entry.type and entry.type:match("[wW]") and "make_status_warning" or "make_status_error"
        vim.fn.sign_place(0, "my_namespace", sign_name, entry.bufnr, { lnum = entry.lnum })
        M.placed_signs[key] = { bufnr = entry.bufnr, lnum = entry.lnum }

        -- Use nvim_buf_set_virtual_text to add the virtual text to the buffer at the specified line
        --if entry.text then
        --    local virt_text = "error description is available"
        --    vim.api.nvim_buf_set_virtual_text(entry.bufnr, 0, entry.lnum - 1, virt_text, {})
        --else
        --    local virt_text = "no error description available"
        --    vim.api.nvim_buf_set_virtual_text(entry.bufnr, 0, entry.lnum - 1, virt_text, {})
        --end
    end
end

-- Run `make` asynchronously
function M.run_make(target)
    M.status = "compiling"
    vim.cmd("redrawstatus")

    local output= {}
    local job = vim.fn.jobstart("make " .. target, {
        on_stdout = function(_, data, _)
            --if data and #data > 0 then
            --    vim.list_extend(output, data)
            --end
        end,
        on_stderr = function(_, data, _)
            if data and #data > 0 then
                vim.list_extend(output, data)
            end
        end,
        on_exit = function(_, exit_code, _)
            print(vim.inspect(output))
            if exit_code == 0 then
                M.status = "good"
                -- Clear previous quickfix list
                vim.fn.setqflist({}, 'r')
                vim.cmd("cclose")
                -- Place signs based on the quickfix list
                M.update_signs()
            else
                M.status = "failed"
                if #output > 0 then
                    -- Clear previous quickfix list
                    vim.fn.setqflist({}, 'r')
                    -- Set the quickfix list with the output
                    vim.fn.setqflist({}, "r", {title = "make " .. target, lines = output})
                    -- Open the quickfix window to show the errors
                    vim.cmd("copen")
                    -- Place signs based on the quickfix list
                    M.update_signs()
                end
            end
            vim.cmd("redrawstatus")
        end
    })
end

-- Command to run make test
vim.api.nvim_create_user_command("Test", function()
    M.run_make("test")
end, {})

-- Command to run make only
vim.api.nvim_create_user_command("Make", function()
    M.run_make("")
end, {})

-- Command to run make tidy
vim.api.nvim_create_user_command("Tidy", function()
    M.run_make("tidy")
end, {})

-- Command to run make play
vim.api.nvim_create_user_command("Play", function()
    M.run_make("play")
end, {})

-- Autocommand to trigger on save
function M.setup()
    return M
end

return M
