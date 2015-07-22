class CreateCurrentLogs < ActiveRecord::Migration
  def change
    create_table :current_logs do |t|
      t.integer :user_id
      t.integer :time_log_id
      t.boolean :logging_flag, default: true

      t.timestamps
    end
    add_index :current_logs, [:user_id, :time_log_id]
  end
end
