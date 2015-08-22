# severely overwritten but what the heck, these classes might come in useful if there's another playing card-based problem

request = require \request
{count-by, obj-to-pairs, sort-by, lines, fold, split-at, words, initial, flatten} = require \prelude-ls

# [Number] -> Boolean
is-consecutive = (arr) ->
    fold (memo, val) ->
        if memo.res and memo.prev and val isnt memo.prev - 1
            memo.res = false
        memo.prev = val
        memo
    , {res: true, prev: false}, arr
    .res

# [a] -> [a] -> [b]
greater-than = (xs, ys) ->
    xs = flatten xs
    ys = flatten ys
    for x, i in xs
        if x is ys[i] then continue
        if x > ys[i] then return true else return false
    \equal

class Card
    (str) ->
        @rank = switch str.0
            | \2 => 0
            | \3 => 1
            | \4 => 2
            | \5 => 3
            | \6 => 4
            | \7 => 5
            | \8 => 6
            | \9 => 7
            | \T => 8
            | \J => 9
            | \Q => 10
            | \K => 11
            | \A => 12
        @suit = str.1

class Hand
    (cards) ->
        @cards = []

        for card in cards
            @cards.push new Card card

        count = @cards
            |> count-by (.rank)
            |> obj-to-pairs
            |> sort-by (-> -it.0)
            |> sort-by (-> -it.1)

        @value = [[x.1 for x in count], [parse-int x.0 for x in count]]

        @value.unshift @rankifier @

    rankifier: (hand) ->
        straight = flush = false

        if is-consecutive hand.value.1 and hand.value.1.length is 5
            straight = true

        if hand.cards.0.suit is hand.cards.1.suit is hand.cards.2.suit is hand.cards.3.suit is hand.cards.4.suit
            flush = true

        switch
        | straight is true and flush is true and hand.value.1.0 is 12 => res = 9
        | straight is true and flush is true                          => res = 8
        | hand.value.0 `greater-than` [4, 1] is \equal                => res = 7
        | hand.value.0 `greater-than` [3, 2] is \equal                => res = 6
        | flush is true                                               => res = 5
        | straight is true                                            => res = 4
        | hand.value.0 `greater-than` [3, 1, 1] is \equal             => res = 3
        | hand.value.0 `greater-than` [2, 2, 1] is \equal             => res = 2
        | hand.value.0 `greater-than` [2, 1, 1, 1] is \equal          => res = 1
        | hand.value.0 `greater-than` [1, 1, 1, 1, 1] is \equal       => res = 0

        res

winner-count = (res, line) ->
    hands = line |> words |> split-at 5

    left = new Hand hands.0
    right = new Hand hands.1

    if left.value `greater-than` right.value
        res['Player 1']++
    else
        res['Player 2']++

    res

request 'http://static.projecteuler.net/project/resources/p054_poker.txt' (error, response, data) !->
    data
    |> lines
    |> initial
    |> fold winner-count, {'Player 1': 0, 'Player 2': 0}
    |> console.log
