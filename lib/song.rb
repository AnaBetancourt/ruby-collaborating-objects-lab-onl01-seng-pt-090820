require 'pry'

class Song 
  attr_accessor :name, :artist 

  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end 
  
  def self.all
    @@all
  end 
  
  def self.new_by_filename(filename)
    song_name = filename.split(" - ")[1]
    song = self.new(song_name)
    song.artist = Artist.new(filename.split(" - ")[0])
    song
  end

  def artist_name=(name)
    new_artist = Artist.find_or_create_by_name(name)
    self.artist = new_artist
  end
  
  
end