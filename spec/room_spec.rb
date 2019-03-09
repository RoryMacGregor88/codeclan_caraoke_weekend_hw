require 'pry'

require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../karaoke_bar.rb')

class TestRoom < Minitest::Test

  def setup
    @guests = []
    @Michael = @guests.push(Guest.new("Michael","Smooth Criminal", 10))
    @Billy = @guests.push(Guest.new("Billy","Uptown Girl", 20))
    @Jenny = @guests.push(Guest.new("Jenny", "Venus", 30))

    @songs = []
    @Off_The_Wall = @songs.push(Song.new("Off The Wall", "Motown", 3))
    @Uptown_Girl = @songs.push(Song.new("Uptown Girl", "Pop", 4))
    @Venus = @songs.push(Song.new("Venus", "Pop", 2))
    @karaoke_bar = Room.new("Jackson", 2, 30, @songs)
  end

  def test_guest_names
    names = @guests.map {|i| i.name}
    assert_equal(["Michael", "Billy", "Jenny"], names)
  end
  def test_guest_fave_songs
    favourite_songs = @guests.map {|i| i.favourite_song}
    assert_equal(["Smooth Criminal", "Uptown Girl", "Venus"], favourite_songs)
  end

  def test_find_song
    result = @karaoke_bar.find_song("Uptown Girl")
    assert_equal(@songs[1], result)
  end

  def test_add_song_to_queue
    @karaoke_bar.add_song_to_queue("Venus")
    assert_equal(1, @karaoke_bar.song_queue.length)
  end

  def test_create_room
    result = @karaoke_bar.create_room("Joel", 4, 60, @songs)
    assert_equal("Joel", result.booking_name)
    assert_equal(4, result.number_of_guests)
    assert_equal(60, result.booked_time)
    assert_equal(@songs, result.song_list)
  end

  # def test_check_in_guest
  #   result = @room1.check_in_guest(@Michael.check_in(2, 20))
  #   assert_equal("Guests: 2, Time: 20 minutes", result)
  # end
end
