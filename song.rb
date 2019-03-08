class Song

  attr_reader :title, :genre, :length

  def initialize(title, genre, length)
    @title = title
    @genre = genre
    @length = length
  end

end
