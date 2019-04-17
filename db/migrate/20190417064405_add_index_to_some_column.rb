class AddIndexToSomeColumn < ActiveRecord::Migration[5.2]
  def change
    add_index :tasks, [:name, :status, :deadline_at]
  end
end
