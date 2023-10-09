class Api::V1::QuotesController < ApplicationController

	# GET /api/v1/quotes
	def index
		@quotes = Quote.ordered
		render json: @quotes
	end


	# POST /api/v1/quotes
	def create
		@quote = Quote.new(quote_params)


		if @quote.save
			render json: @quote, status: :created
		else
			render json: @quote.errors, status: :unprocessable_entity
		end
	end

	# PUT /api/v1/quotes/:id
	def update
		@quote = Quote.find(params[:id])

		if @quote
			@quote.update(quote_params)
			render json: @quote
		else
			render json: @quote.errors, status: :unprocessable_entity
		end
	end

	# DELETE /api/v1/quotes/:id
	def destroy
		@quote = Quote.find(params[:id])

		if @quote
			@quote.destroy
			render json: { message: "Quote deleted!" }, status: :ok
		else
			render json: { error: "Quote not found!" }, status: :unprocessable_entity
		end
	end
end
