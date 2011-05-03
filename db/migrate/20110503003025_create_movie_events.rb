class CreateMovieEvents < ActiveRecord::Migration
  def self.up
    create_table :movie_events do |t|
      t.integer :movie_id
      t.integer :event_id

      t.timestamps
    end
  end

  def self.down
    drop_table :movie_events
  end
end
