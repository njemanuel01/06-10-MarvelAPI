require "sqlite3"

class MarvelResource
  def initialize(name)
    @CONNECTION = SQLite3::Database.new("#{name}_marvel_database.db")
    @CONNECTION.execute("CREATE TABLE IF NOT EXISTS 'heroes' (id INTEGER PRIMARY KEY, name TEXT, 
    description TEXT, comic_total INTEGER, series_total INTEGER, stories_total INTEGER, events_total INTEGER);")
  end
  
  def add_info(name, description, comic_number, series_number, stories_number, events_number)
    name.delete "'"
    description.delete! "'"
    @CONNECTION.execute("INSERT INTO 'heroes' (name, description, comic_total, series_total, stories_total, events_total) VALUES 
    ('#{name}', '#{description}', #{comic_number}, #{series_number}, #{stories_number}, #{events_number});")
  end
end