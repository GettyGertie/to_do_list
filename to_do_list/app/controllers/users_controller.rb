class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user =User.new(user_params)
    if @user.save
      flash[:success]="You're signed in"
      redirect to @user
    else
      flash[:fail]="Invalid signup details"
      render 'new'
  end
  end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
end
