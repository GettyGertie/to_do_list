class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      redirect_to user
    else
      render 'new'
      flash[:danger] = "Invalid!! Try again..."
    end
  end

  def destroy
  end
end
