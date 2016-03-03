class Api::StoresController < Api::BaseController

	skip_before_filter :verify_authenticity_token

	def index
		render json: Store.all
	end

	#READ
	def show
		store = Store.find(params[:id])
		render json: store
	end

	#CREATE
	def create
		store = Store.new(store_params)

		if store.save
			render status: 200, json: {
				message: "Successfully created store.",
				store: store
			}.to_json
		else
			render status: 422, json: {
				errors: store.errors
			}.to_json
  		end
	end

	#UPDATE
	def update
		store = Store.find(params[:id])

		if store.save
			render status: 200, json: {
				message: "Successfully updated.",
				store: store
			}.to_json
		else
			render status: 422, json: {
				errors: store.errors
			}.to_json
  		end
	end

	#DELETE
	def destroy
		store = Store.find(params[:id])
		store.destroy

		render status: 200, json: {
			message: "Successfully deleted."
		}.to_json
	end

	private
	def store_params
		params.require(:store).permit(
			:location_name
		)
	end
end
