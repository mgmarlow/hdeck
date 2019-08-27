# frozen_string_literal: true

RSpec.describe HDeck::Card do
  let(:name)     { 'Test' }
  let(:desc)     { 'A test desc' }
  let(:morality) { 'N' }
  let(:ability)  { 'Dexterity' }

  subject(:card) do
    described_class.new(
      name: name,
      desc: desc,
      morality: morality,
      ability: ability
    )
  end

  describe 'attributes' do
    describe 'name' do
      it 'should return name' do
        expect(card.name).to eq(name)
      end
    end

    describe 'desc' do
      it 'should return desc' do
        expect(card.desc).to eq(desc)
      end
    end

    describe 'morality' do
      it 'should return desc' do
        expect(card.morality).to eq(morality)
      end
    end

    describe 'ability' do
      it 'should return ability' do
        expect(card.ability).to eq(ability)
      end
    end
  end

  describe '#to_s' do
    it 'should return concise card test' do
      expect(card.to_s).to eq("(Dexterity: N) Test\nA test desc")
    end
  end
end
