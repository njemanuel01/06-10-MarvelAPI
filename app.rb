require_relative "marvel.rb"

puts "Enter the name of a Marvel Universe Character."
character_name = gets.chomp

session = Marvel.new(character_name)

while ((session.check_character_name(character_name)) == 404)
  puts "Invalid entry.  Please try again."
  character_name = gets.chomp
  session = Marvel.new(character_name)
end

puts "Here's a description for #{character_name}:"
puts session.fetch_character_description(character_name)

puts "There are #{session.fetch_comic_number(character_name)} comics with #{character_name} in them."



  