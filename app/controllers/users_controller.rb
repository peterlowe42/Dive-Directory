class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      # UserMailer.account_activation(@user).deliver_now
      flash[:notice] = "Congratulations you are now registered"
      redirect_to root_url
    else
      @errors = @user.errors.full_messages
      render "new"
    end
  end

  def show
    @user = current_user
    if @user.nil?
      redirect_to login_path
    end
  end

  def edit
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :first_name, :last_name, :units)
  end
end
