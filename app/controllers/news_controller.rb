class NewsController < ApplicationController
	
	def index
		@news = News.all
	end

	def create
		
	end

	def show
		@news = News.find(params[:id])
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
