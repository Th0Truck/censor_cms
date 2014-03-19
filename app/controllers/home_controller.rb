class HomeController < ApplicationController
  def index
    @setting = Setting.find(1)
    if @setting.homepage > 0
      redirect_to page_path(@setting.homepage)
    end
  end
end
