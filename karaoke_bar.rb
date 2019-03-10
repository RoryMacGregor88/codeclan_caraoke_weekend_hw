class KaraokeBar

  attr_reader :rooms, :guests

  def initialize(rooms, guests)
    @rooms = rooms
    @guests = guests
  end

  def find_room(name)
    result = @rooms.each {|i| return i if i.booking_name == name}
    return result
  end

  def create_room(booking_name, number_of_guests, booked_time)
    @rooms << Room.new(booking_name, number_of_guests, booked_time)
  end

  def create_new_guest(booking_name, favourite_song, money)
    @guests << Guest.new(booking_name, favourite_song, money)
  end

end
