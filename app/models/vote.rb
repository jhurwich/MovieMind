class Vote < ActiveRecord::Base
  validates_presence_of :val, :seen
  validates_presence_of :user
  validates_presence_of :movie


  belongs_to :user
  belongs_to :movie
end
