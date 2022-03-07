class LoginController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:login][:email].downcase)
    if user && user.authenticate(params[:login][:password])
      log_in(user)
      redirect_to root_path
    else
      flash[:danger] = 'Invalid email or password'
      redirect_to root_path
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
