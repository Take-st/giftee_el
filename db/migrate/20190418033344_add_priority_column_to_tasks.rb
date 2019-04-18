class AddPriorityColumnToTasks < ActiveRecord::Migration[5.2]
  def up
    add_column :tasks, :priority, :string, null: true # null: trueを明示する必要がある
  end

  def down
    remove_column :tasks, :priority, :string, null: true
  end
end

# やけくそにnull true追加しまくった。
# 結局カラムを消したり作ったりでは解決しなかった。
# 次のマイグレーションファイルでchange_columnを設定すると、null: true を設定できました
