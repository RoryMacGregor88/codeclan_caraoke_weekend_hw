class Room

  attr_reader :room_number, :capacity, :allocated_time, :song_list

  def initialize(room_number, capacity, allocated_time, song_list)
    @room_number = room_number
    @capacity = capacity
    @allocated_time = allocated_time
    @song_list = song_list
  end

  def find_song(song)
    # binding.pry
    @song_list.each {|i| return i if i.title == song}
  end

end
