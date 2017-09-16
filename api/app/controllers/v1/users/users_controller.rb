class V1::Users::UsersController < V1::ApplicationController
  def update
    if @current_user.update(user_update_params)
      render "v1/users/show_with_all_tokens", status: :ok
    else
      render json: @current_user.errors, status: :unprocessable_entity
    end
  end

  protected

  def user_update_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :phone_number,
    )
  end
end
