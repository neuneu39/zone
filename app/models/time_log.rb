class TimeLog < ActiveRecord::Base
#  belongs_to :user
#  has_one :current_log
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, length: { maximum: 140 }
  validates :user_id, presence: true
end
