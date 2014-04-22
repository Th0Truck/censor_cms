class HomeController < ApplicationController
  def index
    @setting = current_domain
    redirect_to page_path(@setting.homepage)
  end
end
