class V1::Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, :only => [:create]
  respond_to :json

  def create
    user = User.new(user_params)
    # user.confirmed_at = Time.now
    ## TODO: confirming users @ registration

    if user.save
      if sign_in(user)
        @current_user = user
        render "v1/users/show_with_all_tokens"
        return
      end
    else
      warden.custom_failure!
      render :json => { error: user.errors }, status: 422
      return
    end
  end

  protected

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :first_name,
      :last_name,
      :phone_number,
    )
  end
end
