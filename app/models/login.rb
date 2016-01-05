class Login < ActiveRecord::Base
  def self.set_session session,user
    session[:id] = user.id
    session[:name] = user.name
    session[:email] = user.email
    if user.role == 1
      session[:role] = true
    else
      session[:role] = false
    end
  end

  def self.destroy_session session
    session[:id] = nil
    session[:name] = nil
    session[:email] = nil
    session[:role] = nil
  end
end
