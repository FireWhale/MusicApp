class CreateSourceships < ActiveRecord::Migration
  def self.up
    create_table :albums_sources, :id => false do |t|
      t.integer :album_id
      t.integer :source_id
    end
  end

  def self.down
    drop_table :albums_sources
  end
end
