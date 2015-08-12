{filter, even, sum, Func} = require \prelude-ls

# Number -> Number
fibonacci = Func.memoize (n) ->
    if n > 1 then fibonacci(n - 1) + fibonacci (n - 2) else 1

x = 0
fib = 0
fibs = []

loop
    fib = fibonacci x++
    if fib > 4e6 then break else fibs.push fib

fibs
|> filter even
|> sum
|> console.log
