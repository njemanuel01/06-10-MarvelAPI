require "sqlite3"
require_relative "marvel.rb"

puts "What is your name?"
name = gets.chomp

CONNECTION = SQLite3::Database.new("marvel_database.db")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS '#{name}_heroes' (id INTEGER PRIMARY KEY, name TEXT, 
description TEXT, comic_total INTEGER, series_total INTEGER, stories_total INTEGER, events_total INTEGER);")

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
  
  puts "Would you like to see your team? (Y/N)"
  answer2 = gets.chomp
  
  if answer2 == 'Y'
    p session.get_names
    
    puts "Would you like to remove someone from your team? (Y/N)"
    answer3 = gets.chomp
    
    if answer3 == 'Y'
      puts "Who would you like to remove?"
      remove_name = gets.chomp
      
      session.remove_name(remove_name)
      p session.get_names
    end
  end
  
  puts "Would you like to add another character to your team? (Y/N)"
  answer = gets.chomp
end



  