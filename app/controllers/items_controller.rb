class ItemsController < ApplicationController

	before_action :find_item, only: [:show, :edit, :update, :destroy, :complete]

	def index
		@categories = Category.all;

		@items = if params[:tag]
			Item.tagged_with(params[:tag])
		else
			Item.all
		end
	end

	def new
		@item = Item.new
		@categories = Category.all.map{|c| [c.name, c.id]}
	end

	def show
	end

	def create 
		@item = Item.new(item_params)

		if @item.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@categories = Category.all.map{|c| [c.name, c.id]}
	end

	def update
		if @item.update(item_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		@item.destroy
		redirect_to root_path
	end

	def complete
		@item.update_attribute(:completed_at, Time.now)
		redirect_to root_path
	end

	private

		def item_params
			params.require(:item).permit(:title, :description, :category_id)
		end

		def find_item
			@item = Item.find(params[:id])
		end

end
    