class ArtistsController < ApplicationController

	def index
		@title = "All users"
		@artists = Artist.all
	end
	
	def show
		@artist = Artist.find(params[:id])
		@albums = @artist.albums
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
		render 'edit'
	end	
	
	def update
		@artist = Artist.find(params[:id])
		if @artist.update_attributes(params[:artist])
			flash[:success] = "Artist updated :3"
			redirect_to @artist
		end
	end
	
	def destroy
		Artist.find(params[:id]).destroy
		flash[:success] = "Artist deleted!"
		redirect_to artists_path
	end
end
