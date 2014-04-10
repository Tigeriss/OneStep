class StylesController < ApplicationController

	def index
		@styles = Style.all
	end

	def create
		
	end

	def show
		@styles = Style.find(params[:id])
	end

	def destroy
		
	end

	def new
		
	end

	def edit
	 	
	end

	def update
		
	end

end
