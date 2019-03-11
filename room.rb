class Room

  attr_reader :booking_name, :number_of_guests, :booked_time, :song_list, :song_queue, :capacity

  def initialize(booking_name, number_of_guests, booked_time)
    @booking_name = booking_name
    @number_of_guests = number_of_guests
    @booked_time = booked_time
    @capacity = 5
    @song_queue = []
    @song_list = [
      Song.new("Off The Wall", "Motown", 2),
      Song.new("Uptown Girl", "Pop", 4),
      Song.new("Venus", "Pop", 2)
    ]

  end

  def find_song(title)
  @song_list.each {|i| return i if i.title == title}
  return nil
  end

  def add_song_to_queue(song)
    result = find_song(song)
    @song_queue << result
  end

  def add_new_song(title, genre, length)
    @song_list << Song.new(title, genre, length)
  end

end
