class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Log in successfully."
    else
      redirect_to '/log_in', :alert => "Email or password incorrect."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end