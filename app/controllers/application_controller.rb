class ApplicationController < ActionController::API
  rescue_from Exceptions::ApiKeyNotFound, with: :if_api_key_not_found
  rescue_from ActiveRecord::RecordNotFound, with: :if_record_not_found
  rescue_from ActionController::ParameterMissing, with: :if_parameter_missing

  def set_api_key_user
    api_key = ApiKey.find_by(key: params[:api_key])
    raise Exceptions::ApiKeyNotFound unless api_key
  end

  private
  def if_api_key_not_found
    render json: {api_key: 'not found'}
  end

  def if_record_not_found(exception)
    render json: {errors: exception.message}, status: :unprocessable_entity
  end

  def if_parameter_missing(exception)
    render json: {errors:  exception.message}, status: :unprocessable_entity
  end
end
