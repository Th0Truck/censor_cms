# encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_domain, :current_setting, :current_admins, :current_account

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
      #@current_user = @current_users.where(id: session[:user_id])
      @current_user = current_domain.users.find_by_id(session[:user_id])
      #@current_user.settings = @current_user.settings.select{ |s| s.id == @current_domain.id } # Sletter
      #@current_user = @current_user.where(setting: {setting_id: @current_domain.id}).joins(:user_settings)
      #@current_user = @current_user.accounts.map { |a| a.setting_id == @current_domain.id}
      #@current_user ||= @current_user.present? && @current_user.settings.where(id: @current_domain.id)
      #@current_user.accounts.reject{ |s| s.id !=  current_domain.id }
      #@current_user = @current_user.user_accounts.map { |d| d.setting_id == @current_domain.id }
    end
    @current_user
  end

  def current_admins
    @current_admins = current_domain.user_settings.administratorer
  end

  def current_account
    @current_account = current_user.accounts.where(setting_id: current_domain.id).joins(:user_accounts)
  end

  def current_setting
    @current_setting = @current_user.settings.select{ |s| s.id == @current_domain.id }
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