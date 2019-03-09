class Room

  attr_reader :room_number, :capacity, :allocated_time, :song_list, :song_queue

  def initialize(room_number, capacity, allocated_time, song_list)
    @room_number = room_number
    @capacity = capacity
    @allocated_time = allocated_time
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

end
