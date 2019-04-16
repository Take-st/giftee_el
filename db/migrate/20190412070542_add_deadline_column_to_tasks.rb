class AddDeadlineColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :deadline_at, :date, null: false
  end
end
