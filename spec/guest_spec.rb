require 'pry'

require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')

class TestGuest < Minitest::Test

  def setup

    @Michael = Guest.new("Michael","Smooth Criminal")
    @Billy = Guest.new("Billy","Uptown Girl")
    @Jenny = Guest.new("Jenny", "Venus")

    @songs = []
    @Off_The_Wall = @songs.push(Song.new("Off The Wall", "Motown", 3))
    @Uptown_Girl = @songs.push(Song.new("Uptown Girl", "Pop", 4))
    @Venus = @songs.push(Song.new("Venus", "Pop", 2))

    @room = Room.new(1, 2, 30, @songs)
  end
  # binding.pry
  def test_guest_can_select_song
    result = @Billy.select_song("Uptown Girl")
    assert_equal(@Uptown_Girl, result)
  end

  # def test_guest_can_sing_song
  #   @Michael.sing_song(@song1)
  #   assert_equal(1, @Michael.songs_sang.length)
  # end

end
