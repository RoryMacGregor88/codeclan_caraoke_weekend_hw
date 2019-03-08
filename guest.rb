class Guest

  attr_reader :name

  def initialize(name, favourite_song)
    @name = name
    @favourite_song = favourite_song
    @songs_sang = []
  end

  def favourite_song
    return @favourite_song
  end

  def select_song(song_name)
    song = @room.find_song(song_name)
    return song
  end

  def sing_song(song)
    @songs_sang << song
  end

end
