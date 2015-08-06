class CreateTimeLogs < ActiveRecord::Migration
  def change
    create_table :time_logs do |t|
      t.datetime :start_time
      t.datetime :stop_time
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :time_logs, [:user_id, :created_at]
  end
end
