# a -> a -> Bool
cleanly-divisible-by-all = (x, y) ->
    for i from 1 to y
        return false if x % i isnt 0
    true

x = 1
loop, x++
    if x `cleanly-divisible-by-all` 20
        console.log x
        break
