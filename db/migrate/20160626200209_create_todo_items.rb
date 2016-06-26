class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.text :memo
      t.datetime :due_to

      t.timestamps null: false
    end
  end
end
