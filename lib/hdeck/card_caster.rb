# frozen_string_literal: true

module HDeck
  # Manager class for Card Caster
  class CardCaster
    attr_accessor :alignment, :deck

    def initialize(alignment: 'CN')
      @alignment = alignment
      @deck = Deck.new
    end

    def draw_card(amount: 1)
      copy = Marshal.load(Marshal.dump(deck))

      (0...amount).each do |_|
        card = copy.draw
        if card.nil?
          puts "Out of cards. Create a new deck with 'hdeck new'"
          return
        end

        puts "\n#{card}\n\n"
      end
    end

    def throw_card(amount: 1)
      (0...amount).each do |_|
        card = deck.draw
        if card.nil?
          puts "Out of cards. Create a new deck with 'hdeck new'"
          return
        end

        # Bonuses applied via Role Dealer feat
        case detect_alignment_match(card)
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

        puts "\n#{card}\n\n"
      end
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
