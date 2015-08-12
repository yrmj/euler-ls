{reverse, sum, initial, filter, take, reject} = require \prelude-ls

max = 28123

get-divisors = (n) ->
    return [] if n is 0
    small = []
    large = []
    for i from 1 to Math.floor Math.sqrt n
        if n % i is 0
            small.push i
            large.push n / i unless i * i is n
    initial small ++ reverse large

is-abundant = (n) ->
    (sum get-divisors n) > n

abundants = [is-abundant x for x from 0 to max]

is-sum-of-abundants = (n) ->
    for i from 1 to Math.floor n/2
        if abundants[i] and abundants[n - i] then return true
    false

[x for x from 1 to max] |> reject is-sum-of-abundants |> sum |> console.log
