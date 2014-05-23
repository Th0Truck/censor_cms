# encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_domain

  private

  def current_domain
    if @current_domain.blank? || @current_domain.present?
      @current_domain ||= Setting.for_host(request.host)
    end
    @current_domain
  end

  def current_user
    @current_user ||= current_domain.users.find(session[:user_id])
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