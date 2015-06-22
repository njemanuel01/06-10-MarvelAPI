class MarvelResource
  def initialize(name)
    @name = name
  end
  
  def self.add_info(name, description, comic_number, series_number, stories_number, events_number)
    CONNECTION.execute("INSERT INTO '#{@name}_heroes' (name, description, comic_total, series_total, stories_total, events_total) VALUES 
    (?, ?, ?, ?, ?, ?);", name, description, comic_number, series_number, stories_number, events_number)
  end
  
  def self.get_names
    names_array = CONNECTION.execute("SELECT name FROM '#{@name}_heroes';")
  end
  
  def remove_name(name)
    CONNECTION.execute("DELETE FROM '#{@name}_heroes' WHERE name = ?;", name)
  end
    
end