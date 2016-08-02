class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success]="You're signed in"
      redirect_to @user
    else
      flash[:fail]="Invalid signup details"
      render 'new'
  end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.update_attributes(params[:user])
  end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
end