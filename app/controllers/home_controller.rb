class HomeController < ApplicationController
  def index
    @setting = Setting.for_host(request.host)
    redirect_to page_path(@setting.homepage)
  end
end
