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
    vim.fn.system({ "tmux", "paste-buffer", "-d", "-t", target() })
end

-- Send the absolute path of the current buffer, e.g. to @-mention it.
function M.send_file_path()
    send(vim.fn.expand("%:p"))
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
