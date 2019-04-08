RSpec.describe Harrow::Deck do
  subject(:deck) { described_class.new }

  describe '#length' do
    it 'should return 54' do
      expect(deck.length).to eq(54)
    end

    context 'cards drawn without replacement' do
      before do
        deck.draw(replace: false)
        deck.draw(replace: false)
      end

      it 'should return 52' do
        expect(deck.length).to eq(52)
      end
    end
  end

  describe '#draw' do
    context 'replacement is true' do
      let(:replace) { true }

      it 'returns card from the bottom of the deck without affecting length' do
        expect(deck.draw(replace: replace).to_s).to eq('(CE) The Liar')
        expect(deck.length).to eq(54)
      end
    end

    context 'replacement is false' do
      let(:replace) { false }

      it 'returns card from the bottom of the deck while affecting length' do
        expect(deck.draw(replace: replace).to_s).to eq('(CE) The Liar')
        expect(deck.length).to eq(53)
      end
    end
  end

  describe '#shuffle' do
    # TODO
  end
end
