class AlbumsController < ApplicationController
	
	def index
		@title = "All Albums"
		@albums = Album.all
	end
	
	def show
		@album = Album.find(params[:id])
		@artists = @album.artists
		@title = @album.name
	end
	
	def new
		@title = "New Album!"
		@album = Album.new
	end
	
	def create
		@album = Album.new(params[:album])
		@artistexists = Artist.find_by_name(params[:artist][:name])
		if @artistexists.nil? == true
			@album.artists.build(params[:artist])
		else
			@album.artists << Artist.find_by_name(params[:artist][:name])		
		end
		if @album.save
			flash[:success] = "Album Successfully Created!"
			redirect_to @album
		else
			@title = "Didn't work!"
			render 'new'
		end
	end
	
	def edit
		@title = "Edit Album!"
		@album = Album.find(params[:id])
		@artists = @album.artists
		render 'edit'
	end

	
	def update
		@album = Album.find(params[:id])
		@artists = @album.artists
		@artists.each do |each| #Updating Artists Statement
			@existence = each.name #setting an instance variable as each name
			if params[@existence] == "0" #checking the value of params[instance variable]
				@album.artists.delete(Artist.find_by_name(each.name)) #delete that artist relationship
			end
		end
		if params[:artist][:name].to_s.empty? == false #Adding an artist Statement
			@artistexists = Artist.find_by_name(params[:artist][:name])
			if @artistexists.nil? == true
				@album.artists.build(params[:artist])
			else
				@album.artists << Artist.find_by_name(params[:artist][:name])		
			end
		end
		if @album.update_attributes(params[:album])
			flash[:success] = "Album updated!!!! Yay :3"
			redirect_to @album
		end
	end
end
