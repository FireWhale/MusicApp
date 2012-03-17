class Artist < ActiveRecord::Base
	attr_accessible :name, :Activity, :Obtained, :DateChecked
	
	has_and_belongs_to_many :albums
		
		validates:name, :presence => true, :uniqueness => true
end
