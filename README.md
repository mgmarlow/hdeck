# HDeck

[![Build Status](https://travis-ci.org/mgmarlow/hdeck.svg?branch=master)](https://travis-ci.org/mgmarlow/hdeck)
[![Gem Version](https://badge.fury.io/rb/hdeck.svg)](https://badge.fury.io/rb/hdeck)

CLI tool to manage decks of [harrow cards](http://pathfinder.wikia.com/wiki/List_of_harrow_cards).
Designed to make working with the
[Card Caster archetype](https://www.d20pfsrd.com/classes/base-classes/magus/archetypes/paizo-magus-archetypes/card-caster-magus-archetype/)
class easier.

## Installation

```
gem install hdeck
```

## Examples

### General Use

```sh
hdeck new
hdeck shuffle
hdeck draw -n 3

# Outputs:

# (Strength: N) The Keep
# Quiet, unshakeable strength that withstands any hardship.

# (Intelligence: CE) The Snakebite
# Poison, venom, assassination, and discord.

# (Wisdom: CG) The Publican
# Fellowship and refuge. The cyclops is a seemingly inconsequential figure who nonetheless has relevant insight.
```

### Alignment (Role Dealer)

Alignment can also be factored in to take advantage of the Role
Dealer feat. You can configure alignment with the `--alignment`
flag. Defaults to CN.

```
hdeck new --alignment LG
hdeck throw

Full alignment match!
--------------------
crit range: 19-20
crit damage bonus: x3
+4 bonus to confirmation roll

(Strength: LG) The Paladin
Standing resolutely against trouble, without backing down.
```

## API

```
hdeck commands:
  hdeck draw            # draw from harrow deck (with replacement)
  hdeck help [COMMAND]  # Describe available commands or one specific command
  hdeck length          # number of cards left in the deck
  hdeck new             # create a new harrow deck
  hdeck shuffle         # shuffle the active harrow deck
  hdeck throw           # throw card from harrow deck (no replacement)
```

## Roadmap

- [x] Publish gem
- [x] Save & Load decks
- [x] More deck management options (# cards, shuffling)
- [ ] Better CLI formatting
- [ ] Better error handling
- [ ] Harrow reading support

