class AddCountColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :count, :integer
  end
end
