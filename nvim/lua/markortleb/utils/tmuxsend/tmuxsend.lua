-- Send text from nvim into a tmux pane running whatever agent CLI
-- (claude, codex, gemini, ...) happens to be installed. Deliberately
-- tool-agnostic: it just pastes text into a pane, so it keeps working
-- no matter which vendor's CLI is on the other side.
local M = {}

-- Which pane to target. Defaults to tmux's "last active pane" marker,
-- which works as long as you only ever alternate between the nvim pane
-- and the agent pane. If that ever points at the wrong pane (e.g. a
-- three-pane layout), set vim.g.agent_pane to a specific pane id, such
-- as "%3" (see `tmux list-panes -F '#{pane_id} #{pane_current_command}'`).
local function target()
    return vim.g.agent_pane or "!"
end

local function in_tmux()
    return vim.env.TMUX ~= nil
end

-- Route text through a tmux paste buffer rather than `send-keys` so
-- multi-line text arrives as one paste instead of being replayed
-- key-by-key (which can trigger the target shell's own keybindings).
local function send(text)
    if not in_tmux() then
        vim.notify("Not inside tmux, can't send to the agent pane", vim.log.levels.WARN)
        return
    end
    if text == nil or text == "" then
        return
    end
    vim.fn.system({ "tmux", "load-buffer", "-" }, text)
    -- -p sends a bracketed paste when the pane's app supports it, so newlines
    -- in a multi-line selection don't act as Enter and submit the prompt.
    vim.fn.system({ "tmux", "paste-buffer", "-p", "-d", "-t", target() })
end

-- Send the absolute path of the current buffer, e.g. to @-mention it.
function M.send_file_path()
    send(vim.fn.expand("%:p"))
end

-- The directory you're "in": the listed directory in an oil buffer,
-- otherwise the directory of the current file.
local function current_dir()
    if vim.bo.filetype == "oil" then
        local ok, oil = pcall(require, "oil")
        local dir = ok and oil.get_current_dir() or nil
        if dir then
            return vim.fs.normalize(dir)
        end
    end
    return vim.fs.normalize(vim.fn.expand("%:p:h"))
end

-- Path relative to the <leader>ww working dir (vim.g.work_dir). Falls back
-- to the absolute path when the directory is outside it.
local function relative_to_work_dir(path)
    local root = vim.fs.normalize(vim.g.work_dir or vim.fn.getcwd())
    if path == root then
        return "."
    end
    if vim.startswith(path, root .. "/") then
        return path:sub(#root + 2)
    end
    return path
end

-- Send the current directory as an @-mention relative to the working dir,
-- e.g. "@src/components/". Claude Code and Gemini CLI both treat @path as
-- "read this". The relative path only resolves if the agent was started in
-- the working dir, so launch it there.
local function dir_mention()
    return "@" .. relative_to_work_dir(current_dir()) .. "/"
end

function M.send_dir_path()
    send(dir_mention())
end

-- Same text, but to the system clipboard instead of a tmux pane, for when
-- the agent isn't in a pane you can paste into (or you want to paste it yourself).
function M.copy_dir_path()
    local text = dir_mention()
    vim.fn.setreg("+", text)
    vim.notify("Copied " .. text)
end

-- Send the last visual selection, trimmed to the exact charwise range
-- when applicable (linewise/blockwise selections are sent whole-line).
function M.send_selection()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local lines = vim.fn.getline(start_pos[2], end_pos[2])
    if #lines == 0 then
        return
    end
    if vim.fn.visualmode() == "v" then
        lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
        lines[1] = string.sub(lines[1], start_pos[3])
    end
    send(table.concat(lines, "\n"))
end

return M
