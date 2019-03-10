class Guest

  attr_reader :name

  def initialize(name, favourite_song, money)
    @name = name
    @favourite_song = favourite_song
    @money = money
    @songs_sang = []
  end

  def guest_fav_song
    return @favourite_song
  end

  def guest_money
    return @money
  end

  def sing_song(song)
    @songs_sang << song
  end

end
