class ArtistsController < ApplicationController
  def index
    @title = "All users"
		@artists = Artist.all
  end
	
  def show
		@artist = Artist.find(params[:id])
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
	
	def update
	end
end
