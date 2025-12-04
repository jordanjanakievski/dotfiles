local M = {}
local theme_file = vim.fn.stdpath("data") .. "/current_theme.txt"

function M.load()
  local file = io.open(theme_file, "r")
  if file then
    local theme = file:read("*all")
    file:close()
    -- Trim whitespace just in case
    theme = theme:gsub("%s+", "")
    if theme ~= "" then
      -- Try to load the theme, fail silently/gracefully if missing
      local ok, _ = pcall(vim.cmd.colorscheme, theme)
      if not ok then
        -- Fallback if the saved theme is missing (e.g. plugin removed)
        vim.cmd.colorscheme("nightfox") 
      end
    end
  else
    -- Default theme if no file exists
    vim.cmd.colorscheme("nightfox")
  end
end

function M.save(theme_name)
  local file = io.open(theme_file, "w")
  if file then
    file:write(theme_name)
    file:close()
    print("Theme saved: " .. theme_name)
  end
end

return M
