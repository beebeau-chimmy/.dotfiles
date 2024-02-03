-- Autotags Config
require('nvim-autopairs').setup()
require('nvim-ts-autotag').setup()

local npairs = require('nvim-autopairs')
local Rule   = require('nvim-autopairs.rule')

-- Adds Spaces between parenthesis
local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' }, { '<', '>' } }
npairs.add_rule(
    Rule(' ', ' ')
        :with_pair(function (opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({
                brackets[1][1]..brackets[1][2],
                brackets[2][1]..brackets[2][2],
                brackets[3][1]..brackets[3][2],
            }, pair)
        end)
)

for _,bracket in pairs(brackets) do
    npairs.add_rule(
        Rule(bracket[1]..' ', ' '..bracket[2])
            :use_key(' ')
            :with_pair(function() return false end)
            :with_move(function(opts) return opts.prev_char:match('.%'..bracket[2]) ~= nil end)
    )
end
