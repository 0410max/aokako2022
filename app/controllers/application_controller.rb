class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_homes_top_path
    when EndUser
      end_user_path(resource)
    end
  end
  

  def after_log_in_path_for(resource)
    case resource
    when Admin
      admin_homes_top_path
    when EndUser
      end_user_path(resource)
    end
  end


  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :end_user
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:name,:dep,:cor])
  end

  def email_required?
    false
  end

end

