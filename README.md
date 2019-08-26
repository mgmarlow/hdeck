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

Begin the CLI by running the console:

```
hdeck new
```

Follow the commands to manage your harrow deck.

```
What would you like to do? (draw) (throw) (quit)
 draw

(Wisdom: LE) The Eclipse
Loss of faith and purpose, and the subject's doubt about his abilities or prospects.
```

### Alignment (Role Dealer)

Alignment can also be factored in to take advantage of the Role
Dealer feat. You can configure alignment with the `--alignment`
flag. Defaults to CN.

```
hdeck new --alignment LG
```

## Roadmap

- [x] Publish gem
- [ ] Better CLI formatting
- [ ] Better error handling
- [ ] Save & Load decks
- [ ] More deck management options (# cards, shuffling)

