require 'board'

RSpec.describe Board do
	let(:property_data) do
	  [ { 'name' => 'DummyPlace', 'price' => 1, 'colour' => 'red', 'type' => 'property' },
	    { 'name' => 'PlaceDummy', 'price' => 2, 'colour' => 'blue', 'type' => 'property' } ]
	end
	let(:json_file) { double("File") }
	
	describe "#load_properties" do
	  before do
			allow(File).to receive(:read).with("properties.json").and_return(property_data.to_json)
	  end
	  
	  it "loads properties from the json file" do
			board = Board.new
			properties = board.load_properties("properties.json")
			expect(properties.size).to eq(2)
			expect(properties.first).to be_an_instance_of(Property)
			expect(properties.first.get_name).to eq("DummyPlace")
			expect(properties.first.get_price).to eq(1)
			expect(properties.first.get_colour).to eq("red")
			expect(properties.first.get_type).to eq("property")
			expect(properties.first.owned?).to be(false)
	  end
	end
end
  