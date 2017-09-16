class V1::Users::SessionsController < Devise::SessionsController
  prepend_before_action :require_no_authentication, :only => [:create, :refresh]
  respond_to :json

  def create
    user = User.find_for_database_authentication(email: params[:user][:email])

    if user && user.valid_password?(params[:user][:password]) # valid username
      if sign_in(user) # All other devise things
        @current_user = user
        render "v1/users/show_with_all_tokens"
      end
    else
      render json: { error: 'Invalid Email or Password' }, status: :unauthorized
    end
  end


  def destroy
    sign_out("user", @current_user)
    render json: { result: 'Session destroyed' }, status: 200
  end
end
