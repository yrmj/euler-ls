{map, chars, sum} = require \prelude-ls
BigFactorial = require \big-factorial

BigFactorial 100 .to-string! |> chars |> map parse-int |> sum |> console.log
