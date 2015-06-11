require "marvelite"
require_relative "marvel_resource.rb"
# Gets various information about marvel characters based on the user inputted name.
class Marvel
  # Creates and instance of client which accesses the Marvel database and creates and instance of the @hero attribute based on the user inputted character name.
  def initialize(name, character_name)
    @client = Marvelite::API::Client.new( :public_key => '2b4b1e601cc382721ce8b4fceb18494c', 
    :private_key => 'b83361c174682e6fc1488982737c9c564002657a')
    @hero = @client.character(character_name)
    @database = MarvelResource.new(name)
  end
  
  # Checks to see if the entered character name is valid.
  #
  # character_name - string value for the entered name
  # @hero - attribute which contains the object created by marvelite
  #
  # Returns an integer value, 404 is invalid
  def check_character_name(character_name)
    @hero[:code]
  end
  
  def add_character_info
    @database.add_info(@hero.data[:results][0][:name], @hero.data[:results][0][:description], @hero.data[:results][0][:comics][:available],
    @hero.data[:results][0][:series][:available], @hero.data[:results][0][:stories][:available], @hero.data[:results][0][:events][:available])
  end
end