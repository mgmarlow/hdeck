RSpec.describe HDeck::CardCaster do
  let(:alignment) {}

  subject(:card_caster) { described_class.new(alignment: alignment) }

  describe '#detect_alignment_match' do
    let(:card) do
      HDeck::Card.new(
        name: 'Test',
        desc: 'A test desc',
        morality: 'LG',
        ability: 'Dexterity'
      )
    end

    context 'no alignment match' do
      let(:alignment) { 'N' }

      it 'returns :none' do
        expect(card_caster.detect_alignment_match(card)).to eq(:none)
      end
    end

    context 'one axis alignment match' do
      let(:alignment) { 'LE' }

      it 'returns :partial' do
        expect(card_caster.detect_alignment_match(card)).to eq(:partial)
      end
    end

    context 'full alignment match' do
      let(:alignment) { 'LG' }

      it 'returns :full' do
        expect(card_caster.detect_alignment_match(card)).to eq(:full)
      end
    end
  end
end
