class MP3Importer
  attr_accessor :path 
  
  def initialize(path)
    @path = path
  end 
  
  def files
    Dir.glob("#{path}/*.mp3").collect do |filepath|
      filepath.gsub(".spec")
    
  end
  
  
  
end