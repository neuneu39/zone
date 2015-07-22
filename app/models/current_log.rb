class CurrentLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :time_log
end
