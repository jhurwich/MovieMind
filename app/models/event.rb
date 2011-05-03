class Event < ActiveRecord::Base
  validates_presence_of :name, :date

  has_many :movie_events
  has_many :movies, :through => :movie_events
end
