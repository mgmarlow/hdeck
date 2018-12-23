module HDeck
  class Harrow
    attr_accessor :ability_data, :card_data, :cards

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

    def abilities
      ability_data
    end
  end
end
