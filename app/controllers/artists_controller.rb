class ArtistsController < ApplicationController

	def index
		@title = "All users"
		@artists = Artist.all
		@artistssorted = @artists.sort! { |a,b| a.name.downcase <=> b.name.downcase }
	end
	
	def show
		@artist = Artist.find(params[:id])
		@albums = @artist.albums
		@aliases = @artist.aliases #for showing the Artist's Aliases
		@parentalias = Alias.find_by_alias_id(@artist.id) #For Showing the Parent Artist
		if @parentalias.nil? == false
			@parent = Artist.find_by_id(@parentalias[:parent_id])
		end
		@title = @artist.name
		@album = Album.new
	end
	
	def new
		@artist = Artist.new
	end
	
	def create
		@artist = Artist.new(params[:artist])
		if @artist.save
			flash[:success] = "Artist Successfully Created!"
			redirect_to @artist
		else
			@title = "Sign up"
			render 'new'
		end
	end
	
	def edit
		@title = "Edit Artist"
		@artist = Artist.find(params[:id])		
		@aliases = @artist.aliases
		render 'edit'
	end	
	
	def update
		#Updating Artist Params
		@artist = Artist.find(params[:id])
		if @artist.update_attributes(params[:artist])
			flash[:success] = "Artist updated :3"
			redirect_to @artist
		end
		#Deleting an Alias Association
		@aliasesdup = @artist.aliases.dup
		@aliasesdup.each do |each|
			@existence = Artist.find_by_id(each.alias_id).name
			if params[@existence] == "0"
				@aliasdel = Alias.find_by_alias_id(each.alias_id)
				@aliasdel.delete.save
			end
		end
		#Creating An Alias Association
		if params[:alias][:name].to_s.empty? == false
			@alias = Artist.find_by_name(params[:alias][:name])
			if @alias.nil? == false
			@artist.aliases.build(:alias_id => @alias.id).save
			else
				flash[:success] = "Alias Association Failed! Could not find artist to associate"
			end
		end
	end
	
	def destroy
		Artist.find(params[:id]).destroy
		flash[:success] = "Artist deleted!"
		redirect_to artists_path
	end
end
