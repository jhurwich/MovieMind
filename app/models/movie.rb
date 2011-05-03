class Movie < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :genre

  belongs_to :genre

  has_many :movie_tags
  has_many :tags, :through => :movie_tags

  has_many :movie_events
  has_many :events, :through => :movie_events

  has_many :votes
end
