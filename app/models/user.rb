# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  has_many :time_logs
#  has_one :current_log
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :name, presence: true, length: { maximum: 50 }
    
  def log_list
    #準備中
    TimeLog.where("user_id = ?", id)
  end
end
