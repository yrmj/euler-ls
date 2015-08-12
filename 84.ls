{replicate, map, sort-by, zip, take, fold1} = require \prelude-ls

# making use of LiveScript's OO features to save me having to manually keep track of state

# Number -> Number
random = (max) ->
    Math.floor Math.random! * max + 1

# Number
roll-a-die = -> random 4

# [a] -> [a]
shuffle-array = (array) ->
    for i from array.length to 0
        j = random i
        temp = array[i]
        array[i] = array[j]
        array[j] = temp
    array

class CommunityChest
    ->
        @cards = [(-> 0), (-> 10)] ++ replicate 14 '' |> shuffle-array
        @counter = 0

    # Number -> a
    draw: (current-position) ->
        @counter = ++@counter % 15
        if @cards[@counter] is ''
            current-position
        else
            @cards[@counter].call null current-position

class Chance extends CommunityChest
    ->
        @cards = [
            (-> 0)
            (-> 10)
            (-> 11)
            (-> 24)
            (-> 39)
            (-> 5)
            ((pos) -> if pos is 7 then 15 else if pos is 22 then 25 else 5)
            ((pos) -> if pos is 7 then 15 else if pos is 22 then 25 else 5)
            ((pos) -> if 12 < pos < 28 then 28 else 12)
            ((pos) -> pos - 3)
        ] ++ replicate 6 ''
        |> shuffle-array
        @counter = 0

class Board
    ->
        @frequencies = replicate 40 0
        @current-position = 0
        @doubles = 0

    # void
    move: ->
        dice1 = roll-a-die!
        dice2 = roll-a-die!

        /*
        i wanted to use a switch statement for this, but i don't think it would work properly
        hence the horrible nest of ifs below, ugh

        switch (@current-position + dice1 + dice2) % 40
        | 7, 22, 36 => new-position = chance.draw that
        | 2, 17, 33 => new-position = community-chest.draw that
        | 30        => new-position = 10
        | otherwise => new-position = that
        */

        new-position = (@current-position + dice1 + dice2) % 40

        if new-position is 7 or new-position is 22 or new-position is 36
            new-position = chance.draw new-position
        if new-position is 2 or new-position is 17 or new-position is 33
            new-position = community-chest.draw new-position
        if new-position is 30
            new-position = 10

        if dice1 is dice2
            if ++@doubles is 3
                new-position = 10 # i.e. go to jail
                @doubles = 0
        else
            @doubles = 0

        @current-position = new-position
        @frequencies[@current-position]++

community-chest = new CommunityChest
chance = new Chance
board = new Board

# this code looks dumb
square-names = <[ 00 01 02 03 04 05 06 07 08 09 ]> ++ map (.to-string!), [10 to 39]

for to 1e6
    board.move!

board.frequencies
|> zip square-names
|> sort-by -> -it.1
|> take 3
|> map (.0)
|> fold1 (+)
|> console.log
