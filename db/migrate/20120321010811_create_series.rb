class CreateSeries < ActiveRecord::Migration
  def self.up
    create_table :series do |t|
      t.string :name
      t.string :activity
      t.boolean :obtained

      t.timestamps
    end
  end

  def self.down
    drop_table :series
  end
end
