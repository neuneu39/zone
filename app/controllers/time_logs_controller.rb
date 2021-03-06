class TimeLogsController < ApplicationController
  before_filter :authenticate_user!
  before_action :signed_in_user
  before_action :set_time_log, only: [:show, :edit, :update, :destroy]

  def create
    @time_log = current_user.time_logs.build(time_log_params)
    @log_list_items = current_user.log_list
    
  #  respond_to do |format|
      if @time_log.save && !session[:log_flag]
        flash[:success] = "Start Logging!"
        session[:log_flag] = "true"
        redirect_to root_url
      else 
        session[:log_flag] = nil
       @log_list_items = []
        render 'static_pages/home'
      end
   # end
  end
  
  def show
    redirect_to root_url
  end

  def index
  end

  def edit
#    session[:log_flag] = nil
#    reset_session
  end

  def update
    respond_to do |format|
      if @time_log.update(time_log_params)
        format.html { redirect_to @time_log, notice: 'Successfully Updated!!!.' }
        session[:log_flag] = nil
      else
        format.html { render :edit }
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
