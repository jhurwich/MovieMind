class MovieEvent < ActiveRecord::Base
  belongs_to :movie
  belongs_to :event
end
