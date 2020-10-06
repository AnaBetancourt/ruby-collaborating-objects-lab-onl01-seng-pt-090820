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
    name = filename.split(" - ")[1]
    song = self.new(name)
    song.artist = filename.split(" - ")[0]
    Artist.new(song.artist)
    song
  end

  def self.artist_name=(name)
    new_artist = Artist.find_or_create_by_name(name)
    self.artist = new_artist
    Artist.add_song(self)
  end
  
  
end