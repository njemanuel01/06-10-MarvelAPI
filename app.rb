require_relative "marvel.rb"

puts "Enter the name of a Marvel Universe Character."
character_name = gets.chomp

session = Marvel.new()

while session.valid_character == false
  puts "Invalid character name.  Please enter a valid character name."
  puts "Here's a list."
  puts session.characters
  character_name = gets.chomp
end
  