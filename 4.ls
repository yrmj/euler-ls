{filter, maximum, Str} = require \prelude-ls

# a -> Boolean
palindrome = (n) ->
    n = n.to-string!
    n is Str.reverse n

[x * y for x from 100 to 999 for y from 100 to 999]
|> filter palindrome
|> maximum
|> console.log
