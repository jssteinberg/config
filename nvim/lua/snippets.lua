local ls = require("luasnip")
-- some shorthands...
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet

local date = function() return { os.date("%Y-%m-%d") } end
local utc = function() return { os.date("%Y-%m-%dT%H:%M:%S%z") } end
local end_tag_name = function(args, parent)
	return args[1][1]
end

ls.add_snippets(nil, {
	all = {
		s({
			trig = "date",
			namr = "Date",
			dscr = "Date format YYYY-MM-DD",
		}, {
			f(date, {}),
		}),
		s({
			trig = "utc",
			namr = "UTC",
			dscr = "Date format UTC",
		}, {
			f(date, {}),
		}),
	},
})
