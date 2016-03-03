class Api::OrdersController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		render json: Order.all
	end

	#READ
	def show
		order = Order.find(params[:id])
		render json: order
	end

	#CREATE
	def create
		order = Order.new(order_params)

		if order.save
			render status: 200, json: {
				message: "Successfully created order.",
				order: order
			}.to_json
		else
			render status: 422, json: {
				errors: order.errors
			}.to_json
  		end
	end

	#UPDATE
	def update
		order = Order.find(params[:id])

		if order.save
			render status: 200, json: {
				message: "Successfully updated.",
				order: order
			}.to_json
		else
			render status: 422, json: {
				errors: order.errors
			}.to_json
  		end
	end

	#DELETE
	def destroy
		order = Order.find(params[:id])
		order.destroy

		render status: 200, json: {
			message: "Successfully deleted."
		}.to_json
	end

	private
	def order_params
		params.require(:order).permit(
			:order_number, 
			:customer_id, 
			:sales_amount,
			:store_id, 
			:payment_type
			)
	end
end
