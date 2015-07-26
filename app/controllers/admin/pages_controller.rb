class Admin::PagesController < ApplicationController
  before_action :authenticate_user!
  layout "admin/application"
  
  before_action :load_page, only: [:show, :edit, :update]

  def index
    @pages = Page.order(:created_at).paginate page: params[:page], per_page: 7
  end

  def new
    @page = Page.new
  end

  def show    
  end

  def create
    @page = Page.new page_params
    if @page.save
      flash[:success] = t("flash.success_create")
      redirect_to [:admin, @page]
    else
      flash.now[:danger] = t("flash.fail_create")
      render "new"
    end
  end

  def edit    
  end

  def update    
    if @page.update_attributes page_params
      flash[:success] = t("flash.success_update")
      redirect_to [:admin, @page]
    else
      flash.now[:danger] = t("flash.fail_update")
      render "edit"
    end
  end

  def destroy
    @page = Page.friendly.find params[:id]
    @page.destroy
    flash[:success] = t("flash.success_delete")
    redirect_to admin_pages_path
  end

  private
  def page_params
    params.require(:page).permit :id, :title, :name, :content, :show, :parent_id
  end
  def load_page
    @page = Page.friendly.find params[:id]
  end
end
