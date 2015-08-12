# 40 choices on (40/2) nodes
# 40 choose 20 is 40! / 20! ^ 2

fact = (n) ->
    x = 1
    for i from 1 to n
        x *= i
    x

fact(40) / Math.pow fact(20), 2
|> console.log
