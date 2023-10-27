class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update, :destroy]

	def index
		if params[:quote_id]
			@quote = Quote.find(params[:quote_id])
			render :add_category
		end
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
			end
		else
			render :new, status: 422
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
		quote = Quote.find(params[:quote_id])
		if quote.categories.include?(@category)
			quote.categories.delete(@category)
			respond_to do |format|
				format.html { redirect_to quote_path(quote), notice: "Category was successfully removed from Quote." }
			end
			return
		end

		@category.destroy
		respond_to do |format|
			format.html { redirect_to categories_path, notice: "Category was successfully destroyed." }
			# format.turbo_stream
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
