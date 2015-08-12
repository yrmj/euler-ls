{each} = require \prelude-ls

# Number -> Number
square = -> Math.pow it, 2

# [Number] -> Boolean
is-pythy-triplet = (xs) ->
    square(xs[0]) + square(xs[1]) is square (xs[2])

# [Number] -> Number
product = (xs) ->
    xs[0] * xs[1] * xs[2]

[1 to 1000] |> each (a) !->
    [a + 1 to 1000 - a] |> each (b) !->
        c = 1000 - a - b
        if c >= 0 and is-pythy-triplet [a, b, c]
            console.log product [a, b, c]
