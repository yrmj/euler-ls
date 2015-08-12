{last} = require \prelude-ls

# a -> a
smallest-prime-factor = (n) !->
    for i from 2 to n
        return n if i*i > n
        return i if n % i is 0

# a -> [a]
prime-factors = (n) ->
    results = []
    _prime-factors = (n) !->
        spf = smallest-prime-factor n
        if spf > 1
            results.push spf
            _prime-factors n / spf
    _prime-factors n
    results

# a -> a since last is [a] -> a
largest-prime-factor = prime-factors >> last

largest-prime-factor 600851475143 |> console.log
