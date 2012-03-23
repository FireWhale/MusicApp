class Source < ActiveRecord::Base
	attr_accessible :name, :activity, :obtained
	
	has_and_belongs_to_many :albums
		
	validates:name, :presence => true, :uniqueness => true
end
