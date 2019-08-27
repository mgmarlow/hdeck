# frozen_string_literal: true

RSpec.describe HDeck::CardCaster do
  let(:alignment) { 'CN' }

  subject(:card_caster) { described_class.new(alignment: alignment) }

  describe '#draw_card' do
    it 'should not affect deck length' do
      card_caster.draw_card
      expect(card_caster.deck.length).to eq(54)
    end
  end

  describe '#throw_card' do
    it 'should affect deck length' do
      card_caster.throw_card
      expect(card_caster.deck.length).to eq(53)
    end
  end

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
