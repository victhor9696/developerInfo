class Admin::UsersController < ApplicationController
  layout "admin"
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :logged_or_redirect, only: [:index,:edit,:new,:profile,:create,:update,:destroy]
  before_filter :is_admin?, only: [:index,:edit]

  def index
    @users = User.search_data params[:query], params[:page]
    @qtd_page = @users.count / User::Users_per_page
    @query = params[:query]
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.nil?
      flash[:danger] = t("user.user_not_found")
    end
  end

  def profile
    @user = User.find(session[:id])
    render template: "/admin/users/edit"
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:success] = t("user.success")
        format.html { redirect_to "/admin/users" }
      else
        flash[:danger] = t("user.error_save")
        format.html { render :new }
      end
    end
  end

  def auto_register
    @user = User.new(name: params[:email],email: params[:email],password: params[:password],role: 0,status: 1)
    respond_to do |format|
      if @user.save
        Login.set_session session, @user
        flash[:success] = t("user.success")
        format.html { redirect_to "/admin/" }
      else
        flash[:danger] = t("user.error_save")
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = t("user.success")
        format.html { redirect_to '/admin/users/'}
      else
        flash[:danger] = t("user.error_save")
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      flash[:success] = t('user.success_destroy')
      format.html { redirect_to users_url}
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      user_params = params.require(:user).permit(:name, :email, :plain_password,:password, :slug,:status,:role)
      if ((user_params[:password] == "")and(user_params[:plain_password] == ""))
        user_params.delete :plain_password
        user_params.delete :password
        return user_params
      end

      if user_params[:plain_password] != user_params[:password]
        flash[:danger] = t("error.error_password")
        user_params.delete :plain_password
        user_params.delete :password
      end
        user_params.delete :plain_password
      else
      return user_params
    end
end
