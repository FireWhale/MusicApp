class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.string :name
      t.string :Activity
      t.boolean :Obtained
      t.date :DateChecked

      t.timestamps
    end
  end

  def self.down
    drop_table :artists
  end
end
