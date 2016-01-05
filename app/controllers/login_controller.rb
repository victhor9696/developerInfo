class LoginController < ApplicationController
  layout "login"

  def index
    if logged?
      redirect_to '/admin/home'
    end
  end

  def login
	  if request.post?
	    email= params[:email]
      password = params[:password]

      if email.blank? && password.blank?
        flash[:danger] = t("error.info-email-password")
        return render template: "login/index"
      end

      if email.blank?
        flash[:danger] = t("error.info-email")
        return render template: "login/index"
      end

	    if password.blank?
	      flash[:danger] = t("error.info-password")
	       return render template: "login/index"
	    end

    user = User.auth(email,password)
	  if user.nil?
	    flash[:danger] = t("error.fail-login")
	    return render template: "login/index"
	  end
    Login.set_session session,user
    flash[:success] = t("success.welcome")
    redirect_to '/admin/home'
    end
  end

  def logout
    Login.destroy_session session
	  redirect_to '/'
  end

end
