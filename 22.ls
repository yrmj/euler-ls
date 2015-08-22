request = require \request
{sort, zip, map, sum, chars} = require \prelude-ls

get-sum-of-chars = chars >> map((.char-code-at(0) - 64)) >> sum

request 'http://static.projecteuler.net/project/resources/p022_names.txt' (error, response, data) !->
    data
    |> (.split ',')
    |> map (.slice 1 it.length - 1)
    |> sort
    |> zip [1 to data.length]
    |> map -> it[0] * get-sum-of-chars it[1]
    |> sum
    |> console.log
