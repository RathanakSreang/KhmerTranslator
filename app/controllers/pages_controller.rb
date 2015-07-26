class PagesController < ApplicationController
  def show
    @page = Page.status_show.friendly.find params[:id]
  end
end
