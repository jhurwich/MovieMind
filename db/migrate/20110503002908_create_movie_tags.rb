class CreateMovieTags < ActiveRecord::Migration
  def self.up
    create_table :movie_tags do |t|
      t.integer :movie_id
      t.integer :tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :movie_tags
  end
end
