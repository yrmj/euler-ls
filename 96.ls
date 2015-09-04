request = require \request
{lines, tail, map, sum} = require \prelude-ls
{split-by} = require \prelude-ls-extended
{solve} = require \sudoku-ls

process-grid = tail >> solve >> (-> parse-int '' + it['A1'] + it['A2'] + it['A3'])

request 'http://static.projecteuler.net/project/resources/p096_sudoku.txt' (error, response, data) ->
    data |> lines |> split-by 10 |> map process-grid |> sum |> console.log
