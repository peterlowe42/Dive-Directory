class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      @errors = @user.errors.full_messages
      render "new"
    end
  end

  def show
    if session[:user_id] == params[:id].to_i
     @user = User.find_by(session[:user_id])
    else
     redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :first_name, :last_name, :units)
  end
end
