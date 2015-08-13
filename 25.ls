{filter, even, sum, Func} = require \prelude-ls
BigInt = require \big-integer

# Number -> BigInt
fibonacci = Func.memoize (n) ->
    n = BigInt n
    if (n.compare 2) is 1 then fibonacci(n - 1) .add fibonacci (n - 2) else BigInt 1

x = 1

while fibonacci x .to-string! .length < 1000
    x++

console.log x
