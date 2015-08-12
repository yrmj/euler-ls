{filter, sum} = require \prelude-ls

[1 til 1000]
|> filter -> it % 3 is 0 or it % 5 is 0
|> sum
|> console.log
