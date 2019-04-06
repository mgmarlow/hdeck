# HDeck

CLI tool to manage decks of [harrow cards](http://pathfinder.wikia.com/wiki/List_of_harrow_cards).
Designed to make working with the
[Card Caster archetype](https://www.d20pfsrd.com/classes/base-classes/magus/archetypes/paizo-magus-archetypes/card-caster-magus-archetype/)
class easier.

## Examples

### General Use

Begin a pry session by running the console:

```
./bin/console
```

Use `$deck` to manage your deck for a Pathfinder session. New
decks can be created by calling `Harrow::Deck.new`.

```ruby
$deck.draw(1)
# => "(LG) The Paladin"

$deck.shuffle
$deck.draw(1)
# => "(CG) The Juggler"

$deck.draw(1, replace: false, shuffle: false)
# => "(CG) The Juggler"
$deck.length
# => 53
```

### Alignment (Role Dealer)

Alignment can also be factored in to take advantage of the Role
Dealer feat.

```ruby
# Alignment is chaotic neutral by default
$deck.draw(1)
# Full alignment match
# --------------------
# crit range: 19-20
# crit damage bonus: x3
# +4 bonus to confirmation roll
# => "(CN) The Rabbit Prince"

# Change alignment by using the setter
$deck.alignment = "CG"
```
