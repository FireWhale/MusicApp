class AlbumsController < ApplicationController

  def index
    @title = "All Albums"
		@albums = Album.all
  end
	
  def show
		@album = Album.find(params[:id])
  end
	
	def new
		@title = "New Album!"
		@album = Album.new
	end
	
	def create
    @album = Album.new(params[:album])		
		# If name doesn't exist,
		@album.artists.build(params[:artist])
		#	if name exists
		# @album.artists << Artist.find_by_name(params[:artistname])
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
		@album.artists << Artist.find_by_name(params[:artistname])
		if @album.update_attributes(params[:album])
      flash[:success] = "Album updated!!!! Yay :3"
      redirect_to @album
		end
	end
end
