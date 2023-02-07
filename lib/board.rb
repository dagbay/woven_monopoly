require 'json'

require_relative 'property'

class Board
  def initialize
    @properties = Array.new
  end

  # Creates a property for each hash and stores into @properties array.
  def load_properties(json)
    file = File.read(json)
    file_hash = JSON.parse(file)
    file_hash.each do |hash|
      @properties << create_property(hash)
    end
    @properties
  end

  private 
  
  # Takes in a hash and creates a property.
  def create_property(hash)
    property = Property.new(hash)
    property
  end
end