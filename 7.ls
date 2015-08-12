{last} = require \prelude-ls

# a -> [a] -> Bool
check-primacy = (n, xs) ->
    for x in xs
        if n % x is 0
            return false
    true

# a -> [a] -> void
make-next-prime = (n, ns) !->
    n += 2
    unless check-primacy n, ns
        make-next-prime n, ns
    else
        ns.push n

max-prime = 10001
primes = [2 3]

until primes.length is max-prime
    candidate = primes[*-1] + 2
    make-next-prime candidate, primes

primes |> last |> console.log
