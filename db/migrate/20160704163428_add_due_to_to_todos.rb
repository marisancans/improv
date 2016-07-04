class AddDueToToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :due_to, :datetime
  end
end
