require 'player'
require 'board'
require 'game_manager'

RSpec.describe Player do
	let(:game) { double("Game") }
  let(:player) { Player.new("DummyUser", game) }
  let(:property) { double("Property") }
  
	describe '#initialize' do
	  it 'initializes player with default balance of 16' do
		expect(player.get_balance).to eq(16)
	  end
  
	  it 'initializes player with default position of 0' do
		expect(player.get_position).to eq(0)
	  end
  
	  it 'initializes player with an empty array for properties' do
		expect(player.owned_properties).to eq([])
	  end
  
	  it 'initializes player with bankrupt status of false' do
		expect(player.bankrupt?).to eq(false)
	  end
  
	  it 'initializes player with looped status of false' do
		expect(player.looped?).to eq(false)
	  end
	end
  
	describe '#get_balance' do
	  it 'returns the player balance' do
		expect(player.get_balance).to eq(16)
	  end
	end
  
	describe '#get_name' do
	  it 'returns the player name' do
		expect(player.get_name).to eq('DummyUser')
	  end
	end
  
	describe '#get_position' do
	  it 'returns the player position' do
		expect(player.get_position).to eq(0)
	  end
	end
  
	describe '#owned_properties' do
	  it 'returns the array of properties owned by the player' do
		expect(player.owned_properties).to eq([])
	  end
	end
  
	describe '#bankrupt?' do
	  it 'returns the player bankruptcy status' do
		expect(player.bankrupt?).to eq(false)
	  end
	end
  
	describe '#receive' do
	  it 'adds the specified amount to the player balance' do
		player.receive(5)
		expect(player.get_balance).to eq(21)
	  end
	end
  
	describe '#view_game' do
	  it 'returns the game the player is playing' do
		expect(player.view_game).to eq(game)
	  end
	end
  
	describe '#looped?' do
	  it 'returns the looped status of the player' do
		expect(player.looped?).to eq(false)
	  end
	  it "resets the player's looped status to false if payer is not provided" do
		player.instance_variable_set(:@looped, true)
		player.receive(10)
		expect(player.looped?).to be false
	  end
	end
  
	describe '#move_by' do
		let(:limit) { 20 }

		before do
		allow(game).to receive(:get_property).with(0).and_return(property)
		allow(game).to receive(:get_property).with(3).and_return(property)
		allow(game).to receive(:get_property).with(40).and_return(property)
		allow(property).to receive(:get_name).and_return("GO")
		end

		it "updates the player's position" do
			player.move_by(3, 40)
			expect(player.get_position).to eq(3)
		end

		it "loops the player's position when it goes beyond the limit" do
			player.move_by(40, 40)
			expect(player.get_position).to eq(0)
		end

		it "calls the 'has_looped' method when the player's position loops" do
			expect(player).to receive(:has_looped).with(property)
			player.move_by(40, 40)
		end

		it "calls the 'visit' method with the new property" do
			expect(player).to receive(:visit).with(property)
			player.move_by(3, 40)
		end
	end
end