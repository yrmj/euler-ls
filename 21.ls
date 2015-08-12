{reverse, sum, initial, filter} = require \prelude-ls

get-divisors = (n) ->
    if n is 0 then return []
    small = []
    large = []
    for i from 1 to Math.floor Math.sqrt n
        if n % i is 0
            small.push i
            large.push n / i unless i * i is n
    initial small ++ reverse large

divisor-sum = get-divisors >> sum

is-amicable = (n) ->
    n is divisor-sum divisor-sum n and n isnt divisor-sum n

[x for x from 1 til 10000]
|> filter is-amicable
|> sum
|> console.log
