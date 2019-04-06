module Harrow
  class Deck
    include Enumerable

    attr_accessor :alignment

    def initialize(alignment: "CN")
      card_data = JSON.parse(File.read('cards.json'))
      @alignment = alignment
      @cards = get_cards(card_data)
      shuffle
    end

    def length
      @cards.length
    end

    def each(&block)
      @cards.each(&block)
    end

    def draw(shuffle_before: true, replace: true)
      shuffle if shuffle_before
      drawn_card = if replace
        @cards.last
      else
        @cards.pop
      end

      # Bonuses applied via Role Dealer feat
      case detect_alignment_match(drawn_card)
      when :full
        puts "Full alignment match\n"\
              "--------------------\n"\
              "crit range: 19-20\n"\
              "crit damage bonus: x3\n"\
              "+4 bonus to confirmation roll\n"
      when :partial
        puts "Partial alignment match\n"\
              "--------------------\n"\
              "crit range: 19-20"
      end

      drawn_card.to_s
    end

    def detect_alignment_match(card)
      if card.morality == @alignment
        return :full
      end

      @alignment.each_char do |sign|
        if card.morality.include?(sign)
          return :partial
        end
      end

      :none
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
        )
      end
    end
  end
end
