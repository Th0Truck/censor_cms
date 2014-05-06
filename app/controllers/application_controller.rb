# encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_domain

  private

  def current_domain
    if @current_domain.blank?
      @current_domain ||= Setting.find_by_id(session[:domain_id])
      @current_domain ||= Setting.for_host(request.host)
    end
    @current_domain
  end

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find_by_id(session[:user_id])
      @current_user ||= @current_user.present? && @current_user.settings.where(id: current_domain.id)
      @current_user.accounts -= @current_user.accounts.where('setting_id <> ?', current_domain.id)
      #@current_user ||= @current_user.settings.map { |d| d.id == current_domain.id }
    end
    @current_user
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