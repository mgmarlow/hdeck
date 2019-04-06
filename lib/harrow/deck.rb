module Harrow
  class Deck
    include Enumerable

    def initialize
      card_data = JSON.parse(File.read('cards.json'))
      @cards = get_cards(card_data)
    end

    def length
      @cards.length
    end

    def each(&block)
      @cards.each(&block)
    end

    def draw(n, replace: true)
      if replace
        @cards.last(n)
      else
        @cards.pop(n)
      end
    end

    def shuffle
      counter = @cards.length - 1

      while counter > 0
        ri = rand(counter)
        @cards[counter], @cards[ri] = @cards[ri], @cards[counter]
        counter -= 1
      end

      @cards
    end

    private

    def get_cards(card_data)
      card_data.map do |card_data|
        Card.new(
          name: card_data["name"],
          desc: card_data["desc"],
          morality: card_data["morality"]
        ).to_s
      end
    end
  end
end
