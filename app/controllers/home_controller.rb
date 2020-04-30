class HomeController < ApplicationController
  def please_confirm
    if user_signed_in?
      redirect_to posts_path
    else
      redirect_to new_user_sesstion_path
    end
  end
end
