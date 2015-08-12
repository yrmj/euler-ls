{sum, map} = require \prelude-ls

one-to-x = -> [1 to it] # Number -> [Number]
square = -> Math.pow it, 2 # Number -> Number

sum-of-squares = one-to-x >> map(square) >> sum # Number -> Number
square-of-sums = one-to-x >> sum >> square # Number -> Number

n = 100

square-of-sums(n) - sum-of-squares(n) |> console.log
