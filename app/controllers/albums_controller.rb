class AlbumsController < ApplicationController
  def show
		@album = Album.find(params[:id])
  end
	
	def new
		@album = Album.new
	end
end
