class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Your Account Created Successfully'
      redirect_to login_path
    else
      flash[:danger] = 'Please enter valid user or password'
      redirect_to new_user_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
