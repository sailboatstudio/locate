class V1::ApplicationController < ActionController::API
  respond_to :json
  before_action :authenticate_request!
  skip_before_action :authenticate_request!, only: [:refresh]

  def test
    render json: { message: "Yay!" }
  end

  def refresh
    refresh_token = JsonWebToken.decode(params['user']['refresh_token'])

    if refresh_token
      token = Token.where(token: refresh_token["token"], type: 'refresh', active: true).first

      if token
        user = User.where(active_refresh_token: token.id).first

        if user
          @current_user = user
          render "v1/users/auth_token"
        else
          render json: { error: 'Invalid Email or Password' }, status: :unauthorized
        end
      else
        render json: { error: 'Invalid User Refresh Token' }, status: :unauthorized
      end
    else
      render json: { error: 'Invalid Refresh Token' }, status: :unauthorized
    end
  end

  protected

  def authenticate_request!
    # if http_token && http_token == 'H78g8sgsdfGgSDFg89y969sdfyn897SDF89798s7dfSDFbs9dfnsOHFLSDIluisdhf8shdf89shdf98oh4jhr89whpfoishdfiasdfgas9df'
    #   if params[:user_id]
    #     @current_user = params['user_id']
    #   else ##TESTING PURSPOSE ONLY
    #     @current_user = User.first
    #   end
    # else
    #   render json: { error: 'Not Authenticated'] }, status: :unauthorized
    # end
    if user_id_in_token?
      @current_user = User.find(auth_token[:user_id])
    else
      render json: { error: 'Not Authenticated' }, status: :unauthorized
    end
    rescue JWT::ExpiredSignature
      render json: { error: 'Token Expired' }, status: :unauthorized
    rescue JWT::VerificationError, JWT::DecodeError
      render json: { error: 'Not Authenticated' }, status: :unauthorized
  end

  private

  def http_token
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end
end
