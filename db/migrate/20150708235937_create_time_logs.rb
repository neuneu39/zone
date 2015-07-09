class CreateTimeLogs < ActiveRecord::Migration
  def change
    create_table :time_logs do |t|
      t.time :start_time
      t.time :stop_time
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
