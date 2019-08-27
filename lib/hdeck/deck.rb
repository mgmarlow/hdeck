module HDeck
  # Provides a Harrow deck for a Card Caster to interact with
  class Deck
    class OutOfCardsError < StandardError; end
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

    def draw
      if @cards.length <= 0
        puts "Out of cards. Create a new deck with 'hdeck new'"
        return
      end

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
