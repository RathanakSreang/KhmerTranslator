class Admin::SideMenusController < ApplicationController
  before_action :authenticate_user!
  layout "admin/application"
  
  before_action :load_side_menu, only: [:show, :edit, :update]

  def index
    @side_menus = SideMenu.order("created_at").paginate page: params[:page], per_page: 7
  end

  def new
    @side_menu = SideMenu.new
  end

  def show    
  end

  def create
    @side_menu = SideMenu.new side_menu_params
    if @side_menu.save
      flash[:success] = t("flash.success_create")
      redirect_to [:admin, @side_menu]
    else
      flash.now[:danger] = t("flash.fail_create")
      render "new"
    end
  end

  def edit    
  end

  def update    
    if @side_menu.update_attributes side_menu_params
      flash[:success] = t("flash.success_update")
      redirect_to [:admin, @side_menu]
    else
      flash.now[:danger] = t("flash.fail_update")
      render "edit"
    end
  end

  def destroy
    @side_menu = SideMenu.find params[:id]
    @side_menu.destroy
    flash[:success] = t("flash.success_delete")
    redirect_to admin_side_menus_path
  end

  private
  def side_menu_params
    params.require(:side_menu).permit :id, :image, :image_cache, :show, :title, :link
  end
  def load_side_menu
    @side_menu = SideMenu.find params[:id]
  end
end
