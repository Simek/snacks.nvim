---@class snacks.gh.util
local M = {}

local issue_type_colors = {
  blue = "085EC4",
  gray = "6E7781",
  green = "1A7F37",
  orange = "BC4C00",
  pink = "BF3989",
  purple = "8250DF",
  red = "BA1E29",
  yellow = "9A6700",
}

---@param color? string
---@return string
function M.issue_type_color(color)
  color = type(color) == "string" and color:gsub("^#", ""):lower() or ""
  color = issue_type_colors[color] or color
  return color:match("^%x%x%x%x%x%x$") and color or "888888"
end

---@param query string
---@return string
function M.search_query(query)
  local function qualifier(field, value)
    local name = field == "l" and "label" or "type"
    local escaped = value:gsub("\\", "\\\\"):gsub('"', '\\"')
    return name .. ':"' .. escaped .. '"'
  end

  query = query:gsub(":([lt])%((.-)%)", qualifier)
  return vim.trim(query)
end

return M
