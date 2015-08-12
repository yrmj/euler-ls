{even, map, maximum-by} = require \prelude-ls

# Number -> Number
collatz-length = (n) ->
    i = 1
    while n is not 1, i++
        if even n then n /= 2 else n = n * 3 + 1
    i

[x for x from 1 til 1e6]
|> map -> {value: it, collatz: collatz-length it}
|> maximum-by (.collatz)
|> console.log
