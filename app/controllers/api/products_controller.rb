class Api::ProductsController < ApplicationController
	#respond_to :json
	skip_before_filter :verify_authenticity_token

	def index
		render json: Product.all
	end

	#READ
	def show
		product = Product.find(params[:id])
		render json: product
	end

	#CREATE
	def create
		product = Product.new(product_params)

		if product.save
			render status: 200, json: {
				message: "Successfully created product.",
				product: product
			}.to_json
		else
			render status: 422, json: {
				errors: product.errors
			}.to_json
  		end
	end

	#UPDATE
	def update
		product = Product.find(params[:id])

		if product.save
			render status: 200, json: {
				message: "Successfully updated.",
				product: product
			}.to_json
		else
			render status: 422, json: {
				errors: product.errors
			}.to_json
  		end
	end

	#DELETE
	def destroy
		product = Product.find(params[:id])
		product.destroy

		render status: 200, json: {
			message: "Successfully deleted."
		}.to_json
	end

	private
	def product_params
		params.require(:product).permit(
			:name, 
			:price, 
			:description, 
			:product_category, 
			:image
			)
	end
end
