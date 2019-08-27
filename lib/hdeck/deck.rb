# frozen_string_literal: true

module HDeck
  # Provides a Harrow deck for a Card Caster to interact with
  class Deck
    class OutOfCardsError < StandardError; end
    include Enumerable

    def initialize
      card_path = File.expand_path('../../cards.json', File.dirname(__FILE__))
      card_data = JSON.parse(File.read(card_path))
      @cards = get_cards(card_data)
    end

    def length
      @cards.length
    end

    def each(&block)
      @cards.each(&block)
    end

    def draw
      return if @cards.length <= 0

      @cards.shift
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
      card_data.map do |data|
        Card.new(
          name: data['name'],
          desc: data['desc'],
          morality: data['morality'],
          ability: data['ability']
        )
      end
    end
  end
end
