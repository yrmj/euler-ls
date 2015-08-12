{sum, each, filter} = require \prelude-ls

class PrimacyTester
    ->
        @primes = [2]

    test: (n) ~>
        is-prime = true
        for prime in @primes
            if prime > Math.sqrt n then break
            if n % prime is 0
                return false
        if is-prime
            @primes.push n
            true

Tester = new PrimacyTester

[2] ++ [x for x from 3 til 2e6 by 2]
|> filter Tester.test
|> sum
|> console.log
