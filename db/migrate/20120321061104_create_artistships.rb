class CreateArtistships < ActiveRecord::Migration
  def self.up
    create_table :artistships do |t|
      t.integer :album_id
      t.integer :artist_id

      t.timestamps
    end
  end

  def self.down
    drop_table :artistships
  end
end
