class StaticPagesController < ApplicationController
  def home
    @page = Page.status_show.first
  end
end
