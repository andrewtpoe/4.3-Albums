require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "Ideal conditions are valid" do
    a = Album.new(title: 'test_title', genre: 'test_genre', artist: 'test_artist', length: 100)
    assert a.valid?
  end

  test "Valid record can be saved and retrieved" do
  # Make record
  a = Album.new(title: 'test_title', genre: 'test_genre', artist: 'test_artist', length: 100)
  a.save
  # Validate record is present
  record = Album.find_by(title: 'test_title')
  assert record
  end

  test "Title must be present" do
    a = Album.new(genre: 'test_genre', artist: 'test_artist', length: 100)
    assert_equal a.valid?, false
  end

  test "Genre must be present" do
    a = Album.new(title: 'test_title', artist: 'test_artist', length: 100)
    assert_equal a.valid?, false
  end

  test "Artist must be present" do
    a = Album.new(title: 'test_title', genre: 'test_genre', length: 100)
    assert_equal a.valid?, false
  end

  test "Length must be present" do
    a = Album.new(title: 'test_title', genre: 'test_genre', artist: 'test_artist')
    assert_equal a.valid?, false
  end

  test "Title can not have length of zero" do
    a = Album.new(title: '', genre: 'test_genre', artist: 'test_artist', length: 100)
    assert_equal a.valid?, false
  end

  test "Genre can not have length of zero" do
    a = Album.new(title: 'test_title', genre: '', artist: 'test_artist', length: 100)
    assert_equal a.valid?, false
  end

  test "Artist can not have length of zero" do
    a = Album.new(title: 'test_title', genre: 'test_genre', artist: '', length: 100)
    assert_equal a.valid?, false
  end

  test "Length must be an integer" do
    a = Album.new(title: 'test_title', genre: 'test_genre', artist: 'test_artist', length: 'fff')
    assert_equal a.valid?, false
  end

  test "Artist & Song can not be duplicated" do
    a = Album.new(title: 'test_title', genre: 'test_genre', artist: 'test_artist', length: 100)
    a.save
    b = Album.new(title: 'test_title', genre: 'test_genre2', artist: 'test_artist', length: 100)
    assert_equal b.valid?, false
  end

  test "Artist can have multiple songs" do
    a = Album.new(title: 'test_title', genre: 'test_genre', artist: 'test_artist', length: 100)
    a.save
    b = Album.new(title: 'second_test_title', genre: 'test_genre2', artist: 'test_artist', length: 100)
    assert b.valid?
  end

  test "Multiple artists can have same song title" do
    a = Album.new(title: 'test_title', genre: 'test_genre', artist: 'test_artist', length: 100)
    a.save
    b = Album.new(title: 'test_title', genre: 'test_genre', artist: 'second_test_artist', length: 100)
    assert b.valid?
  end

end
