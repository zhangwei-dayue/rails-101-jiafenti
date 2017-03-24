class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :filmname, presence: true
  has_many :movie_relationships
  has_many :members, through: :movie_relationships, source: :user
end
