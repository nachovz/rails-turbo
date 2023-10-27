class QuotesController < ApplicationController
	before_action :set_quote, only: [:show, :edit, :update, :destroy, :add_category]

	def index
		@quotes = Quote.ordered
	end

	def show
	end

	def new
		@quote = Quote.new
	end

	def create
		@quote = Quote.new(quote_params)

		if @quote.save
			respond_to do |format|
				format.html { redirect_to quotes_path, notice: "Quote was successfully created." }
				format.turbo_stream if !request.referer.include?("new")
			end
		else
			render :new, status: 422
		end
	end

	def update
		if @quote.update(quote_params)
			redirect_to quotes_path, notice: "Quote was successfully updated."
		else
			render :edit
		end
	end

	def destroy
		@quote.destroy
		respond_to do |format|
			format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
			format.turbo_stream
		end
	end

	def add_category

		if request.post? && params[:quote][:category_id].present?
			category = Category.find(params[:quote][:category_id])
			@quote.categories << category

			if @quote.save
				respond_to do |format|
					format.html { redirect_to @quote, notice: "Category was added to Quote." }
					format.turbo_stream
				end
			else
				puts "NOT SAVED"
				render :add_category, status: 422
			end
		else
			render :add_category
		end
	end

	private

	def set_quote
		@quote = Quote.find(params[:id])
	end

	def quote_params
		params.require(:quote).permit(:name)
	end
end
