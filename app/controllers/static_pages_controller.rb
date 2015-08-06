class StaticPagesController < ApplicationController
  before_action :set_time_log, only: [:show, :edit, :update, :destroy]

  def home
    if signed_in? 
      @log_list_items = current_user.log_list
      if !session[:log_flag]
        @time_log = current_user.time_logs.build
      else
        @time_log = current_user.time_logs
#        redirect_to root_url success:"session is nil."
      end
    end
  end

  def update
    respond_to do |format|
      if @time_log.update(time_log_params)
        format.html {redirect_to root_url, notice: 'Successfully Updated Static.'}
        render 'static_pages/home'
      else
        render 'static_pages/home'
      end
    end
  end

  def index
  end

  def help
  end

  def about
  end

  def contact

  end
  private
     def time_log_params
       params.require(:time_log).permit(:content,:start_time,:stop_time)
     end  

     def set_time_log
#       @time_log = TimeLog.find(params[:id])
     end
  
end
