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

Use `$player` to manage your Card Caster for a Pathfinder session. New
decks can be created by calling `Harrow::Deck.new`.

```ruby
$player.draw_card
# => "(LG) The Paladin"

# Cards are automatically shuffled before they're drawn
$player.draw_card
# => "(CG) The Juggler"

# This can be turned off by specifying shuffle_before: false
$player.draw_card(shuffle_before: false)
# => "(CG) The Juggler"
$player.deck.length
# => 53
```

### Alignment (Role Dealer)

Alignment can also be factored in to take advantage of the Role
Dealer feat.

```ruby
# Alignment is chaotic neutral by default
$player.draw_card
# Full alignment match
# --------------------
# crit range: 19-20
# crit damage bonus: x3
# +4 bonus to confirmation roll
# => "(CN) The Rabbit Prince"

# Change alignment by using the setter
$player.alignment = "CG"
```
