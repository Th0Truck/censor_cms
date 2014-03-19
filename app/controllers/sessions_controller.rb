class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = "Velkommen #{user.name}"
      redirect_to root_url
    else
      flash[:alert] = "Forkert e-mail eller password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logget ud"
    redirect_to root_url
  end
end
