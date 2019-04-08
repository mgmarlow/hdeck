RSpec.describe Harrow::Card do
  let(:name)     { 'Test' }
  let(:desc)     { 'A test desc' }
  let(:morality) { 'N' }

  subject(:card) do
    described_class.new(
      name: name,
      desc: desc,
      morality: morality
    )
  end

  describe 'attributes' do
    describe 'name' do
      it 'should return name' do
        expect(card.name).to eq('Test')
      end
    end

    describe 'desc' do
      it 'should return desc' do
        expect(card.desc).to eq('A test desc')
      end
    end

    describe 'morality' do
      it 'should return desc' do
        expect(card.morality).to eq('N')
      end
    end
  end

  describe '#to_s' do
    it 'should return concise card test' do
      expect(card.to_s).to eq('(N) Test')
    end
  end
end
