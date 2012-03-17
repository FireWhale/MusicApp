class Album < ActiveRecord::Base
	attr_accessible :name, :releasedate, :Composer, :Publisher, :Genre, :AlbumObtained
	
	has_and_belongs_to_many :artists
	has_and_belongs_to_many :albums
	
	validates :name, :presence => true
	validates :artist_id, :presence => true
	validates :source_id, :presence => true
end
