class KaraokeBar

  attr_reader :rooms, :guests

  def initialize(rooms, guests)
    @rooms = rooms
    @guests = guests
    @rooms_max_capacity = 5
    @entry_fee = 20
  end

  def find_room(name)
    result = @rooms.each {|i| return i if i.booking_name == name}
    return result
  end

  def create_new_guest(booking_name, favourite_song, money)
    @guests << Guest.new(booking_name, favourite_song, money)
  end

  def create_room__check_in_guest(booking_name, number_of_guests, booked_time)
    if number_of_guests < @rooms_max_capacity
      @rooms << Room.new(booking_name, number_of_guests, booked_time)
    end
    else
      return "Max capacity: 5"
  end

  def check_out_guest__remove_room(name)
    @rooms.each {|i| @rooms.delete(i) if i.booking_name == name}
  end

end
