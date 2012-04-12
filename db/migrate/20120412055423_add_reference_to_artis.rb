class AddReferenceToArtis < ActiveRecord::Migration
  def self.up
    add_column :artists, :reference, :string
    add_column :sources, :reference, :string
  end

  def self.down
    remove_column :artists, :reference
	remove_column :sources, :reference
  end
end
