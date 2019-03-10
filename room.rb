class Room

  attr_reader :booking_name, :number_of_guests, :booked_time, :song_list, :song_queue

  def initialize(booking_name, number_of_guests, booked_time)
    @booking_name = booking_name
    @number_of_guests = number_of_guests
    @booked_time = booked_time
    @capacity = 5
    @song_queue = []
    @song_list = [
      song1 = {
        title: "Off The Wall",
        genre: "Motown",
        length: 2
      },
      song2 = {
        title: "Uptown Girl",
        genre: "Pop",
        length: 4
      },
      song3 = {
        title: "Venus",
        genre: "Pop",
        length: 2
      }
  ]
  end

  def find_song(title)
  result = @song_list.each {|i| return i if i[:title] == title}
  return result
  end

  def add_song_to_queue(song)
    result = find_song(song)
    @song_queue << result
  end

  def create_new_song(title, genre, length)
    @song_list << Song.new()
  end

  # def create_room(booking_name, number_of_guests, booked_time, songs)
  #   Room.new(booking_name, number_of_guests, booked_time, songs)
  # end

end
