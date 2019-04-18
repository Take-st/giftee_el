class ChangeNullSettingInPriorityColumn < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :priority, :string, null: true
  end

  def down
    change_column :tasks, :priority, :string, null: true
  end
end
