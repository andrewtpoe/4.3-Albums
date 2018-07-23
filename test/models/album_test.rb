require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "Ideal conditions work as expected" do
    a = Album.new(title: 'test_title', genre: 'test_genre', artist: 'test_artist', length: 100)
    assert a.valid?
  end

  test "Valid record can be saved and retrieved" do
    Album.create!(title: 'test_title', genre: 'test_genre', artist: 'test_artist', length: 100)
    record = Album.find_by(title: 'test_title')
    assert record.present?
  end

  test "Title can not be blank" do
    a = Album.new(title: '', genre: 'test_genre', artist: 'test_artist', length: 100)
    refute a.valid?
    assert a.errors.keys.include?(:title)
  end

  test "Genre can not be blank" do
    a = Album.new(title: 'test_title', genre: '', artist: 'test_artist', length: 100)
    refute a.valid?
    assert a.errors.keys.include?(:genre)
  end

  test "Artist can not be blank" do
    a = Album.new(title: 'test_title', genre: 'test_genre', artist: '', length: 100)
    refute a.valid?
    assert a.errors.keys.include?(:artist)
  end

  test "Length can not be blank" do
    a = Album.new(title: 'test_title', genre: 'test_genre', artist: 'test_artist', length: nil)
    refute a.valid?
    assert a.errors.keys.include?(:length)
  end

  test "Title can not have length of zero" do
    a = Album.new(title: '', genre: 'test_genre', artist: 'test_artist', length: 100)
    refute a.valid?
    assert a.errors.keys.include?(:title)
  end

  test "Genre can not have length of zero" do
    a = Album.new(title: 'test_title', genre: '', artist: 'test_artist', length: 100)
    refute a.valid?
    assert a.errors.keys.include?(:genre)
  end

  test "Artist can not have length of zero" do
    a = Album.new(title: 'test_title', genre: 'test_genre', artist: '', length: 100)
    refute a.valid?
    assert a.errors.keys.include?(:artist)
  end

  test "Length must be an integer" do
    a = Album.new(title: 'test_title', genre: 'test_genre', artist: 'test_artist', length: 'fff')
    refute a.valid?
    assert a.errors.keys.include?(:length)
  end

  test "Artist & Song can not be duplicated" do
    Album.create!(title: 'test_title', genre: 'test_genre', artist: 'test_artist', length: 100)
    b = Album.new(title: 'test_title', genre: 'test_genre2', artist: 'test_artist', length: 100)
    refute b.valid?
  end

  test "Artist can have multiple songs" do
    Album.create!(title: 'test_title', genre: 'test_genre', artist: 'test_artist', length: 100)
    b = Album.new(title: 'second_test_title', genre: 'test_genre2', artist: 'test_artist', length: 100)
    assert b.valid?
  end

  test "Multiple artists can have same song title" do
    Album.create!(title: 'test_title', genre: 'test_genre', artist: 'test_artist', length: 100)
    b = Album.new(title: 'test_title', genre: 'test_genre', artist: 'second_test_artist', length: 100)
    assert b.valid?
  end

end
