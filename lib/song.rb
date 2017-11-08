class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(find_song)
    if self.find_by_name(name) || self.create_by_name(name) == nil
      song = self.new
      song.name = find_song
      song.save
      song
    else
    self.find_by_name(name) || self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    #  line = filename
    # data = line.split(" - ")
    # artist_name = data[0]
    # song_name = data[1].gusb(".mp3", "")
    # 
    # song = self.new
    # artist_name = song.artist_name
    # song_name = song.name
    # song
    c = self.new 
    c.name = filename.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = filename.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c
  end

  def create_from_filename(filename)
    self.new_from_filename(filename).save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
