class AlbumsController < ApplicationController
	
	def index
		@title = "All Albums"
		@albums = Album.all
	end
	
	def show
		@album = Album.find(params[:id])
		@artists = @album.artists
		@sources = @album.sources
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
		@sourceexists = Source.find_by_name(params[:source][:name])
		if @sourceexists.nil? == true
			@album.sources.build(params[:source])
		else
			@album.sources << Source.find_by_name(params[:source][:name])		
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
		@sources = @album.sources
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
		@sources = @album.sources
		@sources.each do |each| #Updating Sources Statement
			@existence = each.name #setting an instance variable as each name
			if params[@existence] == "0" #checking the value of params[instance variable]
				@album.sources.delete(Source.find_by_name(each.name)) #delete that source relationship
			end
		end
		if params[:source][:name].to_s.empty? == false #Adding an source Statement
			@sourceexists = Source.find_by_name(params[:source][:name])
			if @sourceexists.nil? == true
				@album.sources.build(params[:source])
			else
				@album.sources << Source.find_by_name(params[:source][:name])		
			end
		end
		if @album.update_attributes(params[:album])
			flash[:success] = "Album updated!!!! Yay :3"
			redirect_to @album
		end
	end
	
	def destroy
		Album.find(params[:id]).destroy
		flash[:success] = "Album deleted!"
		redirect_to albums_path
	end
end
