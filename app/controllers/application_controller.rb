class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  def logged?
    if(session[:id].nil?)
      return false
    end
    return true
  end

  def logged_or_redirect
    if !logged?
      flash[:danger] = flash[:danger] = t("error.not_permission")
      redirect_to "/"
    end
  end

  def lgged_in_login_page
  	if !session[:id].nil?
  		redirect_to "/admin/dashboard"
  	end
  end

  def is_admin?
    if logged?
      if !session[:role]
        flash[:danger] = t("error.not_permission")
        return false
      else
        return true
      end
    end
    return false
  end

end
