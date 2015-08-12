{filter, even, sum} = require \prelude-ls
BigInt = require \big-integer

# (a -> b) -> (a -> b)
memoise = (f) ->
    memo = {}
    (arg) ->
        memo[arg] = f arg unless memo[arg]
        memo[arg]

# BigInt -> BigInt
fibonacci = memoise (n) ->
    n = BigInt n
    if (n.compare 2) is 1 then fibonacci(n - 1) .add fibonacci (n - 2) else BigInt 1

x = 1

while fibonacci x .to-string! .length < 1000
    x++

console.log x
