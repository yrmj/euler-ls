{each} = require \prelude-ls

num-divisors = (n) ->
    sqrt = Math.floor Math.sqrt n
    result = 0
    for i from 1 to sqrt
        if n % i is 0 then result += 2
    if sqrt * sqrt is n then result--
    result

x = 0
i = 1

while num-divisors(x) <= 500, i++
    x += i

console.log x
