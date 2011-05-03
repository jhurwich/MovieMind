class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :val
      t.boolean :seen
      t.integer :user_id
      t.integer :movie_id

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
