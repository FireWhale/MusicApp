class AlbumsController < ApplicationController
  def show
		@album = Album.find(params[:id])
  end
	
	def new
		@album = Album.new
	end
	
	def create
    @album = Album.new(params[:album])
    if @album.save
			flash[:success] = "Album Successfully Created!"
      redirect_to @album
    else
      @title = "Sign up"
      render 'new'
    end
  end
	
	def edit
    @album = Album.find(params[:id])
    @title = "Edit album"
		@artistship = Artistship.where(:album_id=>params[:id])
		@artist_list = []
		@artistship.each do |artist|
			@artists_list << artist.artist_id
		end
		render 'edit'
	end

	
	def update
	  @album = Album.find(params[:id])
		params[:album][:artists] = Artist.find(params[:artist_id])
		if @album.update_attributes(params[:album])
      flash[:success] = "Album updated!!!! Yay :3"
      redirect_to @album
		end
	end
end
