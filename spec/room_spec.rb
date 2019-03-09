require 'pry'

require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')
require_relative('../karaoke_bar.rb')

class TestRoom < Minitest::Test

  def setup

    @guests = []
    @guest1 = @guests.push(Guest.new("Michael","Smooth Criminal", 10))
    @guest2 = @guests.push(Guest.new("Billy","Uptown Girl", 20))
    @guest3 = @guests.push(Guest.new("Jenny", "Venus", 30))

    @rooms = []
    @rooms << Room.new("Jackson", 2, 30)
    @karaoke_bar =  KaraokeBar.new(@rooms, @guests)
  end

  def test_guest_names
    names = @karaoke_bar.guests.map {|i| i.name}
    assert_equal(["Michael", "Billy", "Jenny"], names)
  end
  #
  def test_guest_fave_songs
    favourite_songs = @karaoke_bar.guests.map {|i| i.favourite_song}
    assert_equal(["Smooth Criminal", "Uptown Girl", "Venus"], favourite_songs)
  end
  #
  def test_find_song
    expected = @karaoke_bar.rooms[0].song_list[1]
    result = @karaoke_bar.rooms[0].find_song("Uptown Girl")
    assert_equal(expected, result)
  end

  def test_add_song_to_queue
    @karaoke_bar.rooms[0].add_song_to_queue("Venus")
    assert_equal(1, @karaoke_bar.rooms[0].song_queue.length)
  end

end
