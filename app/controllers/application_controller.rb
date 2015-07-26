class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_locale
  before_filter :set_pages_for_menu
  before_filter :set_slider
  before_filter :set_side_menu
  protect_from_forgery with: :exception

  protected
  def set_pages_for_menu
    @menu_pages ||= Page.status_show.roots
  end

  def set_slider
    @sliders ||= Slider.status_show.order("created_at")
  end

  def set_side_menu
    @sidebars ||= SideMenu.status_show.order("created_at")
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end
end
