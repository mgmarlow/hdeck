# HDeck

CLI tool to manage decks of [harrow cards](http://pathfinder.wikia.com/wiki/List_of_harrow_cards).

## Draw Harrow Cards

Usage: `hdeck [number of cards]`

```
hdeck

# The Trumpet (LG)
# An archon who dives aggressively and righteously into danger.

hdeck 3

# The Sickness (NE)
# Corruption, famine, plague, pestilence, and disease.
#
# The Bear (N)
# Pure strength that cannot be truly tamed or trained.
#
# The Hidden Truth (LG)
# The discovery of the greater truth within.
```

## Convert Playing Cards to Harrow Card

> Since Harrow decks consist of 54 cards, jokers need to be included. These are
> denoted by `J1` and `J2`.

Usage: `hdeck <value><suit>`

Example:

```
hdeck 4D # Four of Diamonds

# The Tangled Briar (LE)
# A historical thing or creature that will have some influence on the question.
```
