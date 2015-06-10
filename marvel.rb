require "marvelite"

class Marvel
  attr_reader :characters
  def initialize()
    @client = Marvelite::API::Client.new( :public_key => '2b4b1e601cc382721ce8b4fceb18494c', 
    :private_key => 'b83361c174682e6fc1488982737c9c564002657a')
    @characters = @client.characters
  end
  
  def valid_character(character_name)
    @characters.include?(character_name)
  end
    
end