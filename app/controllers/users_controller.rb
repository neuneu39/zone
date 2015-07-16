class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @time_logs = @user.time_logs
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the ZONE!"
      redirect_to @user
    else
      render 'new'
    end
  end
end

