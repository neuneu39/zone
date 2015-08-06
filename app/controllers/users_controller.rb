class UsersController < ApplicationController
  
  def index
    @user = User.find(params[:id])
    @time_log = @user.time_logs
  end

  def show
    @user = User.find(params[:id])
    @time_log = @user.time_logs || []
    @log_list_items = current_user.log_list
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

