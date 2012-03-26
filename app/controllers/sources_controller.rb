class SourcesController < ApplicationController

	def index
		@title = "All users"
		@sources = Source.all
	end
	
	def show
		@source = Source.find(params[:id])
		@albums = @source.albums
		@title = @source.name
		@album = Album.new
	end
	
	def new
		@source = Source.new
	end
	
	def create
		@source = Source.new(params[:source])
		if @source.save
			flash[:success] = "Source Successfully Created!"
			redirect_to @source
		else
			@title = "Sign up"
			render 'new'
		end
	end
	
	def edit
		@title = "Edit Source"
		@source = Source.find(params[:id])
		render 'edit'
	end	
	
	def update
		@source = Source.find(params[:id])
		if @source.update_attributes(params[:source])
			flash[:success] = "Source updated :3"
			redirect_to @source
		end
	end
	
	def destroy
		Source.find(params[:id]).destroy
		flash[:success] = "Source deleted!"
		redirect_to sources_path
	end
end