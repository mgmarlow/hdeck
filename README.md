# HDeck

CLI tool to manage decks of [harrow cards](http://pathfinder.wikia.com/wiki/List_of_harrow_cards).

## Example

Begin a pry session by running the console: `./bin/console`.

```ruby
deck = Harrow::Deck.new
deck.draw(1)
# => "(LG) The Paladin"

deck.shuffle
deck.draw(1)
# => "(CG) The Juggler"

deck.draw(1, replace: false)
# => "(CG) The Juggler"
deck.length
# => 53
```
