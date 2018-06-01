class RegistrationsController < Devise::RegistrationsController

  def additional_info_update
    params.permit!
    # devise_parameter_sanitizer.permit(:account_update, keys: [:skill_level])
    current_user.update_without_password(params["user"])
    redirect_to root_path
  end

end
