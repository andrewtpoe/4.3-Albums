class Album < ActiveRecord::Base
  validates :title, :genre, :artist, :length, presence: true
  validates :title, :genre, :artist, :length, length: { minimum: 1 }
  validates :length, numericality: true
  validates :title, uniqueness: {scope: :artist}

end
