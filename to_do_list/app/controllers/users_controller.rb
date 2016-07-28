class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user =User.new
    if @user.save
      flash[:success]="You're signed in"
      redirect to @user
    else
      flash[:fail]="Invalid signup details"
      render 'new'
  end
  end


end
