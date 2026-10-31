local root = vim.fs.dirname(vim.fs.abspath(arg[0]))
local servers = dofile(root .. "/nvim/lua/config/lsp-servers.lua")

local width = 72
local tty = vim.uv.guess_handle(1) == "tty" and vim.uv.new_tty(1, false)
if tty then
    width = math.min(tty:get_winsize() or width, width)
end

local function wrap(text, indent)
    local lines, line = {}, indent
    for word in text:gmatch("%S+") do
        if #line > #indent and #line + 1 + #word > width then
            lines[#lines + 1] = line
            line = indent
        end
        line = line .. (#line > #indent and " " or "") .. word
    end
    lines[#lines + 1] = line
    return table.concat(lines, "\n")
end

local function check(server)
    local path = vim.fn.exepath(server.bin)
    if path == "" then
        return false, path, "not on PATH"
    end
    if not server.version then
        return true, path
    end

    local ok, result = pcall(function()
        return vim.system(server.version, { text = true, timeout = 10000 }):wait()
    end)
    local output = ok and vim.trim((result.stdout ~= "" and result.stdout or result.stderr or ""):match("[^\n]*")) or ""
    if not ok or result.code ~= 0 then
        return false, path, "version check failed: " .. output
    end

    if server.min_version then
        local found = vim.version.parse(output, { strict = false })
        if not found or vim.version.lt(found, server.min_version) then
            return false, path, ("found %s, need %s+"):format(output, server.min_version)
        end
    end

    return true, path
end

local missing = {}
for _, server in ipairs(servers) do
    local ok, path, problem = check(server)
    if ok then
        io.write(("✓ %s: %s"):format(server.language, server.bin), "\n")
        io.write("  " .. path, "\n")
    else
        missing[#missing + 1] = { server = server, path = path, problem = problem }
    end
end

for _, m in ipairs(missing) do
    local server = m.server
    io.write("\n")
    io.write(("✗ %s: %s"):format(server.language, server.bin), "\n")
    io.write(wrap(m.problem, "  "), "\n")
    if m.path ~= "" then
        io.write("  " .. m.path, "\n")
    end
    io.write(("  Install (%s):"):format(server.scope), "\n")
    for _, command in ipairs(server.commands) do
        io.write("    " .. command, "\n")
    end
    for _, note in ipairs(server.notes) do
        io.write(wrap(note, "  "), "\n")
    end
end
