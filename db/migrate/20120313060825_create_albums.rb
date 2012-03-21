class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :name
      t.date :releasedate
      t.string :genre
      t.string :publisher
      t.boolean :albumobtained

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
