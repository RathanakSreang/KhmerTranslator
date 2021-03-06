class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  layout "admin/application"
  before_action :load_user, only: [:show, :edit, :update]
  before_action :admin_user, except: [:show, :index]

  def index
    @users = User.order("created_at").paginate page: params[:page], per_page: 7
  end

  def show    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_param
    if @user.save
      flash[:success] = t("flash.success_create")
      redirect_to [:admin, @user]
    else
      flash.now[:danger] = t("flash.fail_create")
      render "new"
    end
  end

  def edit    
  end

  def update
    if params[:user][:password].present?
      if @user.update_attributes user_param
        flash[:success] = t("flash.success_update")
        redirect_to [:admin, @user]
      else
        flash.now[:danger] = t("flash.fail_update")
        render "edit"
      end
    else
      if @user.update_without_password user_param
        flash[:success] = t("flash.success_update")
        redirect_to [:admin, @user]
      else
        flash.now[:danger] = t("flash.fail_update")
        render "edit"
      end
    end    
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:success] = t("flash.success_delete")
    redirect_to admin_users_path
  end

  private
  def load_user
    @user = User.find params[:id]
  end

  def admin_user
    redirect_to admin_users_path unless current_user.admin?
  end

  def user_param
    params.require(:user).permit :id, :email, :password, :password_confirmation, :role
  end
end
