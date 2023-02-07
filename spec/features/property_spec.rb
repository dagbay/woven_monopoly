require 'property'

describe Property do
  describe '#initialize' do
    context 'with name, price, colour, and type in the hash' do
      let(:property) { Property.new({'name' => 'DummyPlace', 'price' => 1, 'colour' => 'blue', 'type' => 'property'}) }

      it 'sets the name' do
        expect(property.get_name).to eq('DummyPlace')
      end

      it 'sets the price' do
        expect(property.get_price).to eq(1)
      end

      it 'sets the colour' do
        expect(property.get_colour).to eq('blue')
      end

      it 'sets the type' do
        expect(property.get_type).to eq('property')
      end

      it 'is not owned' do
        expect(property.owned?).to be false
      end
    end

    context 'with missing data in the hash' do
      let(:property) { Property.new({'name' => 'DummyPlace'}) }

      it 'sets the name' do
        expect(property.get_name).to eq('DummyPlace')
      end

      it 'defaults price to n/a' do
        expect(property.get_price).to eq('n/a')
      end

      it 'defaults colour to n/a' do
        expect(property.get_colour).to eq('n/a')
      end

      it 'defaults type to n/a' do
        expect(property.get_type).to eq(nil)
      end

      it 'is not owned' do
        expect(property.owned?).to be false
      end
    end
  end

  describe '#set_owner' do
    let(:player) { double('player') }
    let(:property) { Property.new({'name' => 'DummyPlace', 'price' => 1, 'colour' => 'blue', 'type' => 'property'}) }

    it 'sets the owner of the property' do
      property.set_owner(player)
      expect(property.get_owner).to eq(player)
    end

    it 'marks the property as owned' do
      property.set_owner(player)
      expect(property.owned?).to be true
    end
  end

  describe '#double_rent' do
    let(:property) { Property.new({'name' => 'DummyPlace', 'price' => 1, 'colour' => 'blue', 'type' => 'property'}) }

    it 'doubles the rent of the property' do
      property.double_rent
      expect(property.get_price).to eq(2)
    end
  end
end
