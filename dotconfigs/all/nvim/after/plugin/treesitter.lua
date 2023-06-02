
local function read_stdout(cmd)
    local process = io.popen(cmd)
    local contents = process:read("*a")
    process:close()
    return contents
end

local function script_path()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*[/\\])") or "./"
end

local function filename()
    return script_path() .. '/nix-info.txt'
end

local function docs()

    local contents = ""
    local f = io.open(filename(), "r")
    if f then
        contents = f:read("*a")
        f:close()
    else
        contents = read_stdout("nix-shell -p nix-info --run 'nix-info -m'")
        f = io.open(filename(), "w")
        f:write(contents)
        f:close()
    end

    local doc = "help"
    if string.find(contents, ", Ubuntu,") or string.find(contents, ", NixOS,") then
        doc = "vimdoc"
    end

    return doc

end

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "typescript", "javascript", "rust", "haskell", "c", "lua", "vim", docs() },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
