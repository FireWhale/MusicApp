class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :name
      t.date :releasedate
      t.string :Composer
      t.string :Publisher
      t.string :Genre
      t.boolean :AlbumObtained
      t.integer :artist_id
      t.integer :source_id

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
