{map, sum} = require \prelude-ls

# fuck yes, this thing is rad
# Number -> String
stringifizerator = (n) ->
    numbers = <[ one two three four five six seven eight nine ]>
    teens = <[ eleven twelve thirteen fourteen fifteen sixteen eighteen nineteen ]>
    decades = <[ ten twenty thirty forty fifty sixty seventy eighty ninety ]>

    ones = (n) ->
        if 20 > n % 100 > 10 then
            return ''
        n = n % 10
        if n then numbers[n-1] else ''

    tens = (n) ->
        if 20 > n % 100 > 10 then
            n = n % 100 - 10
            return teens[n-1] + ' '
        n = Math.floor(n % 100 / 10)
        if n then decades[n-1] + ' ' else ''

    hundreds = (n) ->
        if n % 100 then and-string = 'and ' else and-string = ''
        n = Math.floor(n % 1000 / 100)
        if n then numbers[n-1] + ' hundred ' + and-string else ''

    thousands = (n) ->
        n = Math.floor(n % 10000 / 1000)
        if n then numbers[n-1] + ' thousand ' else ''

    thousands(n) + hundreds(n) + tens(n) + ones(n)

find = new RegExp ' ', 'g'

# String -> Number
letter-counterator = (str) ->
    str.replace find, '' .length

[1 to 1000]
|> map stringifizerator
|> map letter-counterator
|> sum
|> console.log
