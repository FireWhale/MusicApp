class CreateAlbumArtistJoinTables < ActiveRecord::Migration
  def self.up
    create_table :albumsartists, :id => false do |t|
      t.integer :album_id
      t.integer :artist_id

      t.timestamps
    end
  end

  def self.down
    drop_table :albumsartists
  end
end
