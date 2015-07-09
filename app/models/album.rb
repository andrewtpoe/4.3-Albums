class Album < ActiveRecord::Base
  validates :title, :genre, :artist, :length, presence: true
  validates :length, numericality: true
  validates :title, uniqueness: { scope: :artist }

end
