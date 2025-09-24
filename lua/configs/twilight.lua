local options = {
  dimming = {
    alpha = 0.3,
    inactive = true,
  },
  context = 0,
  treesitter = true,
  expand = {
    -- Lua
    "table_constructor",
    "assignment_statement",
    "local_declaration",
    "function_declaration",
    "function_definition",
    "local_function",
    "block",

    -- Python
    "function_definition",
    "class_definition",
    "if_statement",
    "for_statement",
    "while_statement",
    "try_statement",
    "with_statement",
    "dictionary",
    "list",
    "set",
    "tuple",
    "dictionary_comprehension",
    "list_comprehension",
    "set_comprehension",
    "generator_expression",
  },
  exclude = {},
}

return options
