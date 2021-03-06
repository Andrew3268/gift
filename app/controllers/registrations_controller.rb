class RegistrationsController < Devise::RegistrationsController
  
  # def after_inactive_sign_up_path_for(resource)
  #   '/home/please_confirm'
  # end  
  

private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

end

