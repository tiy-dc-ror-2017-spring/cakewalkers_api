class ApplicationController < ActionController::API
  # resuce_from ActiveRecord::RecordNotFound, :handle_not_found
  #
  # rescue_from StandardError do |exception|
  #   render :json => @error_object.to_json, :status => :unprocessable_entity
  # end
  #
  # def handle_not_found
  #   render json: { msg: "Record not found"}
  # end
end
