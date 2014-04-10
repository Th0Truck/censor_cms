# encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_domain

  private

  def current_domain
    if @current_domain.blank?
      #@current_domain = current_user && current_user.domain
      @current_domain ||= Setting.find_by_id(session[:domain_id])
      @current_domain ||= Setting.for_host(request.host)
    end
    @current_domain
  end

  def current_user

    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
        #redirect_to(root_url) if current_user.nil?
    rescue
      #redirect_to root_url, :alert => t('generic.requirelogin')
    end
  end

  def cap
    capitalize
  end

  def require_login
    unless current_user
      redirect_to login_url, :notice => 'Du skal være logget ind for at få adgang.'
    end
  end
end
