class AddBodyToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :body, :string
  end
end
