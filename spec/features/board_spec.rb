require 'board'
require 'json'
RSpec.describe Board do
	before do
		@board = Board.new
		@json = 'board_test.json'   
	end
	describe 'JSON file' do
		it 'should be loaded' do
			expect(@board.load_properties(@json).count).to be > 0
		end
	end
end