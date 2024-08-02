local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local fmta = require("luasnip.extras.fmt").fmta
local ltdate = os.date("%d/%m/%Y")


ls.add_snippets("markdown", {
  s("indexls", fmta([[
[(Return to Index)](#index)
]],
    {
    }))
})

