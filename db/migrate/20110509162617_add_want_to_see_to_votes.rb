class AddWantToSeeToVotes < ActiveRecord::Migration
  def self.up
    add_column :votes, :want_to_see, :boolean
  end

  def self.down
    remove_column :votes, :want_to_see
  end
end
