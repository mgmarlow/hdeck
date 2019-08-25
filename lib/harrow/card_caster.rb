module Harrow
  # Manager class for Card Caster
  class CardCaster
    attr_accessor :alignment, :deck

    def initialize(alignment: 'CN')
      @alignment = alignment
      @deck = Deck.new
    end

    def draw_card(shuffle_before: true, replace: false, calculate_match: false)
      if deck.length <= 0
        puts 'Deck is out of cards'
        return
      end

      deck.shuffle if shuffle_before

      drawn_card = deck.draw(replace: replace)

      if calculate_match
        # Bonuses applied via Role Dealer feat
        case detect_alignment_match(drawn_card)
        when :full
          puts "Full alignment match!\n"\
                "--------------------\n"\
                "crit range: 19-20\n"\
                "crit damage bonus: x3\n"\
                "+4 bonus to confirmation roll\n"
        when :partial
          puts "Partial alignment match!\n"\
                "--------------------\n"\
                "crit range: 19-20\n"
        end
      end

      puts("\n#{drawn_card.to_s}\n\n")
    end

    def detect_alignment_match(card)
      return :full if card.morality == @alignment

      @alignment.each_char do |sign|
        return :partial if card.morality.include?(sign)
      end

      :none
    end
  end
end
