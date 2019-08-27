# frozen_string_literal: true

RSpec.describe HDeck::Deck do
  subject(:deck) { described_class.new }

  describe '#length' do
    it 'should return 54' do
      expect(deck.length).to eq(54)
    end
  end

  describe '#draw' do
    it 'returns card from the top of the deck' do
      expected = 'The Paladin'
      expect(deck.draw.name).to eq(expected)
      expect(deck.length).to eq(53)
    end

    context 'out of cards' do
      it 'should return nil' do
        (0..53).each do |_|
          deck.draw
        end

        expect(deck.draw).to eq(nil)
      end
    end
  end

  describe '#shuffle' do
    # TODO
  end
end
