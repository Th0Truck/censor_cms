class HomeController < ApplicationController
  def index
    @setting = current_domain
    if @setting.homepage > 0
      redirect_to page_path(@setting.homepage)
    end
  end
end
