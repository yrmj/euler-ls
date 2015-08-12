{map, chars, sum} = require \prelude-ls
BigInt = require \big-integer # fuck it

BigInt '2' .pow 1000 .to-string! |> chars |> map parse-int |> sum |> console.log
