require_relative "marvel.rb"

session = Marvel.new()

puts "Enter the name of a Marvel Universe Character."
character_name = gets.chomp

while ((session.check_character_name(character_name)) == 404)
  puts "Invalid entry.  Please try again."
  character_name = gets.chomp
end

puts "Here's a description for #{character_name}:"
puts session.fetch_character_description(character_name)
  