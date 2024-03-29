class CreateSources < ActiveRecord::Migration
  def self.up
    create_table :sources do |t|
      t.string :name
      t.string :activity
      t.boolean :obtained

      t.timestamps
    end
  end

  def self.down
    drop_table :sources
  end
end
