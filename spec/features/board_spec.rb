require 'board'
RSpec.describe Board do
    before do
        @board = Board.new
        @json = { :name=>'DummyName', :type=>'DummyType' }.to_json
    end
    describe 'JSON file' do
        context 'should be loaded do' do
            it 'given all information is there' do
                # expect(@board.load_board()).to
            end
        end
        context 'should still be loaded' do
            it 'given there is no price and colour' do
                expect(@board.load_board(@json)).to eq(@json)
            end
        end
    end

end