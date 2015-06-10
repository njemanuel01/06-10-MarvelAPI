require "marvelite"

class Marvel
  attr_reader :characters
  def initialize()
    @client = Marvelite::API::Client.new( :public_key => '2b4b1e601cc382721ce8b4fceb18494c', 
    :private_key => 'b83361c174682e6fc1488982737c9c564002657a')
  end
  
  def fetch_character_name(character_name)
    hero = @client.character(character_name)
    hero.data[:results][0][:name]
  end
  
  def fetch_character_description(character_name)
    hero = @client.character(character_name)
    hero.data[:results][0][:description]
  end
    
end