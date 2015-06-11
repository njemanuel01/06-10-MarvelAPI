require_relative "marvel.rb"

puts "What is your name?"
name = gets.chomp

puts "Would you like to build or add to your Marvel Team? (Y/N)"
answer = gets.chomp

while answer == 'Y'
  puts "Who would you like to join your Marvel Team?"
  character_name = gets.chomp

  session = Marvel.new(name, character_name)

  while ((session.check_character_name(character_name)) == 404)
    puts "Invalid entry.  Please try again."
    character_name = gets.chomp
    session = Marvel.new(name, character_name)
  end
  
  session.add_character_info
  
  puts "Would you like to add another character to your team? (Y/N)"
  answer = gets.chomp
end



  