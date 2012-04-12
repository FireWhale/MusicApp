class AddReferenceToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :reference, :string
  end

  def self.down
    remove_column :albums, :reference
  end
end
