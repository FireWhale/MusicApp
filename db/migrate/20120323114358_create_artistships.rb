class CreateArtistships < ActiveRecord::Migration
  def self.up
    create_table :artistships, :id => false do |t|
      t.integer :album_id
      t.integer :artist_id
    end
  end

  def self.down
    drop_table :artistships
  end
end
