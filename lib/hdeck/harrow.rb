module HDeck
  class Harrow
    attr_accessor :ability_data, :card_data, :cards, :playing_card_hash

    PLAYING_CARDS = [
      'AH', '2H', '3H', '4H', '5H', '6H', '7H', '8H', '9H', '10H', 'JH', 'QH', 'KH',
      'AS', '2S', '3S', '4S', '5S', '6S', '7S', '8S', '9S', '10S', 'JS', 'QS', 'KS',
      'AC', '2C', '3C', '4C', '5C', '6C', '7C', '8C', '9C', '10C', 'JC', 'QC', 'KC',
      'AD', '2D', '3D', '4D', '5D', '6D', '7D', '8D', '9D', '10D', 'JD', 'QD', 'KD',
      'J1', 'J2'
    ]

    def initialize
      @card_data = JSON.parse(File.read('cards.json'))
      @ability_data = JSON.parse(File.read('abilities.json'))
    end

    Card = Struct.new(:name, :desc, :morality)
    def cards
      @cards ||= card_data.map do |card_data|
        Card.new(card_data["name"], card_data["desc"], card_data["morality"])
      end
    end

    def convert_from_playing_card(playing_card)
      playing_card_hash[playing_card]
    end

    # TODOS

    def shuffle_deck
    end

    def draw(n)
    end

    private

    def playing_card_hash
      return @playing_card_hash unless @playing_card_hash.nil?

      hash = {}

      cards.sort_by(&:name).each.with_index do |card, i|
        hash[PLAYING_CARDS[i]] = card[:name]
      end

      @playing_card_hash = hash
    end
  end
end
