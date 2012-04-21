class Artist < ActiveRecord::Base
	attr_accessible :name, :activity, :obtained, :reference
	
	has_and_belongs_to_many :albums
	has_many :aliases, :foreign_key => "parent_id", :dependent => :destroy
	has_many :alias, :through => :aliases, :source => :parent
	
	
	validates:name, :presence => true, :uniqueness => true
end
