require 'json'
require_relative 'property'
class Board
    def initialize
        @properties = Array.new
    end
    def load_properties(json)
        file = File.read(json)
        file_hash = JSON.parse(file)
        file_hash.each do |hash|
            @properties << create_property(hash)
        end
        @properties
    end
    private 
    def create_property(hash)
        property = Property.new(hash)
        property.get_hash
    end
end