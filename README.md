# Holdem Helper

This app gives basic poker strategy based on insight aroud the internet.

### Startup
Answer a couple questions:
1. How many people are playing?
2. Standard/Tight/Loose? [To be implemented]

### Cards are dealt (Pre-Flop), Position

The app will calculate whether you should play this hand or not based on "Raise First In" principles. This means, if all people before you check or fold, this is a hand you should raise with.  It does so based on [Uptown Poker's 8 charts](https://upswingpoker.com/preflop/). ~With less than 9 people, some of the charts are eliminated, resulting in looser play~(To be implemented).

Consider raising 2.5-4x the minimum bet.

#### What two cards have you been dealt? 

*Case sensitivity doesn't matter*
* Answer with a string of: 
    * First Letter of Rank
    * First Letter of Suit
    * First Letter of Second Rank
    * First Letter of Second Suit
* Examples: 
    * `ASJH`: Ace of Spades, Jack of Hearts
    * `TCKD`: Ten of Clubs, King of Diamonds

Valid card values: `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10`, `J`, `Q`, `K`, `A`

Valid suits: `S`, `H`, `C`, `D`

#### How many people away from the Big Blind are you? For example, with a standard 9 person table:

_You can also enter negative numbers (-1 == small blind)_
* 0 - Big Blind
* 1 - Under the Gun
* 2 - Under the Gun + 1
* 3 - Under the Gun + 2
* 4 - Lowjack
* 5 - Highjack
* 6 - Cutoff
* 7 - Button
* 8 - Small Blind

### Flop is Played [To Be Implemented]

User is prompted for the three flop cards. Enter using the same syntax as hand, except 6 character string.

* Your percent chance of winning is displayed. [To be implemented]
* Other post-flop strategy from upswing is displayed. [To be implemented]

## Installation

Clone repo and run via `ruby` commands from the command line. After app is started it will run until a `quit` command is entered.
* `ruby holdem-cli.ruby`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dmorrissey14/holdem-cli.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## General Poker Notes

#### Preflop
* https://www.bigfishgames.com/blog/casino/texas-hold-em-guide/texas-hold-em-strategy-by-table-size/
* https://www.cardschat.com/preflop-calling-hand-ranges.php

#### General
* http://www.holdemindicator.com/screenshots.php
* https://en.wikipedia.org/wiki/Pot_odds
* https://forumserver.twoplustwo.com/32/beginners-questions/pot-odds-calculating-outs-rule-2-4-a-389150/
* https://www.reddit.com/r/poker/comments/facqh/can_someone_explain_to_me_what_ev_is_and_how_to/
* https://www.reddit.com/r/poker/comments/jrwjx/my_attempt_at_a_new_player_guide_beginners_guide/