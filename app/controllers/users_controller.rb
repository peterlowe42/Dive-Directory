class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      @message = "Congratulations You've registered"
    else
      @errors = @user.errors.full_messages
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :first_name, :last_name)
  end
end
