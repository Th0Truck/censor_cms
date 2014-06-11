# encoding: utf-8
class SessionsController < ApplicationController
  def new

  end

  def create
    if auth_hash && auth_hash.present?
      user = current_domain.users.from_omniauth(auth_hash)
    else
      user = current_domain.users.authenticate(params[:email], params[:password], params[:setting_id])
    end

    if user
      session[:user_id] = user.id
      flash[:success] = "Velkommen #{user.name}"
      redirect_to root_url
    else
      flash[:alert] = "Forkert e-mail eller password"
      user = nil
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logget ud"
    redirect_to root_url
  end

  def setup_facebook
    request.env['omniauth.strategy'].options[:client_id] = current_domain.facebook
    request.env['omniauth.strategy'].options[:client_secret] = current_domain.facebook_secret
    render :text => "Setup complete.", :status => 404
  end

  def setup_linkedin
    request.env['omniauth.strategy'].options[:client_id] = current_domain.linkedin
    request.env['omniauth.strategy'].options[:client_secret] = current_domain.linkedin_secret
    render :text => "Setup complete.", :status => 404
  end

  def setup_googleplus
    request.env['omniauth.strategy'].options[:client_id] = current_domain.googleplus
    request.env['omniauth.strategy'].options[:client_secret] = current_domain.googleplus_secret
    render :text => "Setup complete.", :status => 404
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
