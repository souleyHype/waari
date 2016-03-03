class Api::CustomersController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		render json: Customer.all
	end

	#READ
	def show
		customer = Customer.find(params[:id])
		render json: customer
	end

	#CREATE
	def create
		customer = Customer.new(customer_params)

		if customer.save
			render status: 200, json: {
				message: "Successfully created customer.",
				customer: customer
			}.to_json
		else
			render status: 422, json: {
				errors: customer.errors
			}.to_json
  		end
	end

	#UPDATE
	def update
		customer = Customer.find(params[:id])

		if customer.save
			render status: 200, json: {
				message: "Successfully updated.",
				customer: customer
			}.to_json
		else
			render status: 422, json: {
				errors: customer.errors
			}.to_json
  		end
	end

	#DELETE
	def destroy
		customer = Customer.find(params[:id])
		customer.destroy

		render status: 200, json: {
			message: "Successfully deleted."
		}.to_json
	end

	private
	def customer_params
		params.require(:customer).permit(
			:first_name,
			:last_name,
			:phone,
			:email
			)
	end
end
