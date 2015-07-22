class CurrentLogController < ApplicationController
before_action :set_current_log, only[:show, :edit, :update, :destroy]

  def create
    @current_log = current_user.current_log.build(current_log_params)

    respond_to do |format|
      if @current_log.save
        flash[:success] = "current_log created"
      end
    end        
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @current_log.update(current_log_params)
        flash[:success] = "current_log updated"
      end
    end
  end
    
  private
    def current_log_params
      params.require(:current_log).permit(:user_id, :time_log_id, :flag)
    end

    def set_current_log
      if(!params[:id].empty?)
        @current_log = CurrentLog.find(params[:id])
      elsif
        @current_log = current_user.CurrentLog
      end
    end

end
