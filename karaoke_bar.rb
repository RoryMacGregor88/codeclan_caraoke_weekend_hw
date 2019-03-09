class Room

  attr_reader :booking_name, :number_of_guests, :booked_time, :song_list, :song_queue

  def initialize(booking_name, number_of_guests, booked_time, song_list)
    @booking_name = booking_name
    @number_of_guests = number_of_guests
    @booked_time = booked_time
    @song_list = song_list
    @song_queue = []
  end

  def find_song(song)
  result = @song_list.each {|i| return i if i.title == song}
  return result
  end

  def add_song_to_queue(song)
    result = find_song(song)
    @song_queue << result
  end

  def create_room(booking_name, number_of_guests, booked_time, songs)
    Room.new(booking_name, number_of_guests, booked_time, songs)
  end

end
