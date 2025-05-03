# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

 

  protected
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sigh_in, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    bookmarks_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
  
end
