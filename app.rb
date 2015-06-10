require_relative "marvel.rb"

puts "Enter the name of a Marvel Universe Character."
character_name = gets.chomp

session = Marvel.new()

puts session.fetch_character(character_name)
  