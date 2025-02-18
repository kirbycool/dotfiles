-- Highlight groups that use exclusively terminal colors.
-- Use with `notermguicolors`.

local c = {
  black = 0,
  dark_red = 1,
  dark_green = 2,
  dark_yellow = 3,
  dark_blue = 4,
  dark_magenta = 5,
  dark_cyan = 6,
  gray = 7,
  dark_gray = 8,
  red = 9,
  green = 10,
  yellow = 11,
  blue = 12,
  magenta = 13,
  cyan = 14,
  white = 15,
}

local groups = {
  Comment = { ctermfg = c.dark_gray },
  Conceal = { ctermfg = c.dark_gray }, -- placeholder characters substituted for concealed text (see 'conceallevel')
  Folded = { ctermfg = c.dark_gray, bold = true }, -- line used for closed folds
  LineNr = { ctermfg = c.dark_gray }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  Pmenu = { ctermfg = c.white, ctermbg = c.black }, -- Popup menu: normal item.
  PmenuSel = { ctermfg = c.black, ctermbg = c.gray }, -- Popup menu: selected item.
  Title = { ctermfg = c.dark_green },

  Constant = { ctermfg = c.dark_yellow },
  Function = { ctermfg = c.blue }, -- function name (also: methods for classes)
  Identifier = { ctermfg = c.white }, -- (preferred) any variable name
  Keyword = { ctermfg = c.magenta }, --  any other keyword
  Operator = { ctermfg = c.cyan }, -- "sizeof", "+", "*", etc.
  Special = { ctermfg = c.dark_yellow },
  Statement = { ctermfg = c.magenta }, -- (preferred) any statement
  Type = { ctermfg = c.yellow }, -- (preferred) int, long, char, etc.

  -- treesitter
  ["@tag.attribute"] = { ctermfg = c.dark_red },
  ["@variable"] = { link = "Identifier" },
  ["@variable.member"] = { ctermfg = c.dark_red },

  -- lsp
  ["@lsp.type.property"] = { ctermfg = c.dark_red },
}

for group, hl in pairs(groups) do
  vim.api.nvim_set_hl(0, group, hl)
end
