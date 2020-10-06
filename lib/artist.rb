require 'pry'

class Artist
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def add_song(song)
    song.artist = self
  end 
  
  def songs 
    Song.all.select{|song| song.artist == self}
  end 

# def self.find(name)
#     Artist.all.find{|artist| artist.name == name}
#   end

# def self.find_or_create_by_name(name)
#     if self.find(name)
#       return self.find(name)
#     else
#       return Artist.new(name)
#     end
#   end

  def self.find_or_create_by_name(name)
    self.all.find do |artist| 
    if artist.name == name
       artist
     else 
       self.new(name)
     end
    end
  end
  
  def print_songs
    puts self.songs
  end
end