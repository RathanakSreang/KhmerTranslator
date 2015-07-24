class Admin::SlidersController < ApplicationController
  before_action :authenticate_user!
  layout "admin/application"
  
  before_action :load_slider, only: [:show, :edit, :update]

  def index
    @sliders = Slider.order("created_at").paginate page: params[:page], per_page: 7
  end

  def new
    @slider = Slider.new
  end

  def show    
  end

  def create
    @slider = Slider.new slider_params
    if @slider.save
      flash[:success] = t("flash.success_create")
      redirect_to [:admin, @slider]
    else
      flash.now[:danger] = t("flash.fail_create")
      render "new"
    end
  end

  def edit    
  end

  def update    
    if @slider.update_attributes slider_params
      flash[:success] = t("flash.success_update")
      redirect_to [:admin, @slider]
    else
      flash.now[:danger] = t("flash.fail_update")
      render "edit"
    end
  end

  def destroy
    @slider = Slider.find params[:id]
    @slider.destroy
    flash[:success] = t("flash.success_delete")
    redirect_to admin_sliders_path
  end

  private
  def slider_params
    params.require(:slider).permit :id, :logo, :logo_cache, :show
  end
  def load_slider
    @slider = Slider.find params[:id]
  end
end
