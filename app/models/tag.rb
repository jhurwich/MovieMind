class Tag < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :movie_tags
  has_many :movies, :through => :movie_tags
end
