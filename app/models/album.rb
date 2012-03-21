class Album < ActiveRecord::Base
	attr_accessible :name, :releasedate, :genre, :publisher, :albumobtained
	
	has_and_belongs_to_many :artists
	has_and_belongs_to_many :series
	
	validates :name, :presence => true
end
