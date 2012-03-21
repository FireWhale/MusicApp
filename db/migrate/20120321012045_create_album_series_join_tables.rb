class CreateAlbumSeriesJoinTables < ActiveRecord::Migration
  def self.up
    create_table :albums_series, :id => false do |t|
      t.integer :album_id
      t.integer :series_id
    end
  end

  def self.down
    drop_table :albums_series
  end
end
