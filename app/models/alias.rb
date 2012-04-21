class Alias < ActiveRecord::Base
	attr_accessible :alias_id
	
	belongs_to :parent, :class_name => "Artist"
	belongs_to :alias, :class_name => "Artist"
end
