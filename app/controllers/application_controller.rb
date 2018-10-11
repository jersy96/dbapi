class ApplicationController < ActionController::API
  rescue_from Exceptions::ApiKeyNotFound, with: :if_api_key_not_found

  def set_api_key_user
    api_key = ApiKey.find_by(key: params[:api_key])
    raise Exceptions::ApiKeyNotFound unless api_key
  end

  private
  def if_api_key_not_found
    render json: {api_key: 'not found'}
  end
end
