class RegistrationsController < Devise::RegistrationsController

  def additional_info_update
    # devise_parameter_sanitizer.permit(:account_update, keys: [:skill_level])
    current_user.update_without_password(additional_info_params)
    redirect_to root_path
  end

  private

  def additional_info_params
    params.require(:user).permit(:skill_level)
  end

end
