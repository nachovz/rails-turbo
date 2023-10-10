class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update, :destroy]

	def index
		@categories = Category.ordered
	end

	def show
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			respond_to do |format|
				format.html { redirect_to categories_path, notice: "Category was successfully created." }
				format.turbo_stream
			end
		else
			render :new
		end
	end

	def update
		if @category.update(category_params)
			redirect_to categories_path, notice: "Category was successfully updated."
		else
			render :edit
		end
	end

	def destroy
		@category.destroy
		respond_to do |format|
			format.html { redirect_to categories_path, notice: "Category was successfully destroyed." }
			format.turbo_stream
		end
	end

	private

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name)
	end

end