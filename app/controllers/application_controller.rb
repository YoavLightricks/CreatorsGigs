class ApplicationController < ActionController::API
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::NameError, with: :error_occurred
  rescue_from ::AASM::InvalidTransition, with: :invalid_transition
  before_action :authenticate_user

  protected

  def record_not_found(exception)
    render json: {error: exception.message}.to_json, status: :not_found
    return
  end

  def error_occurred(exception)
    render json: {error: exception.message}.to_json, status: :internal_server_error
    return
  end

  def authenticate_user
    AuthenticatedUser.create(:user_id => 1, apikey: "yyy111333")
    @authenticated_user = AuthenticatedUser.find_by(apikey: params[:api_key])
    if @authenticated_user.nil?
      render json: {error: "You are not authorized to access this resource"}, status: :unauthorized
      return
    end
  end
end
