class TimeLogsController < ApplicationController
  before_filter :authenticate_user!
  before_action :signed_in_user
  before_action :set_time_log, only: [:show, :edit, :update, :destroy]
  def create
    @time_log = current_user.time_logs.build(time_log_params)
    if @time_log.save
      flash[:success] = "Start Logging!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

#  def show
#   @time_log = 
#  end

  def index
  end

  def update
    respond_to do |format|
      if @time_log.update(time_log_params)
        format.html {redirect_to root_url, notice: 'Successfully Updated.'}
      else
        render 'static_pages/home'
      end
    end
  end

  def destroy
  end

  private

     def time_log_params
       params.require(:time_log).permit(:content,:start_time,:stop_time)
     end  
 # Before actions
     def signed_in_user
       redirect_to signin_url, notice: "Please sign in." unless signed_in?
     end
     def set_time_log
       @time_log = TimeLog.find(params[:id])
     end
end
