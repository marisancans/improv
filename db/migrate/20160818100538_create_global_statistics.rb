class CreateGlobalStatistics < ActiveRecord::Migration
  def change
    create_table :global_statistics do |t|

      t.timestamps null: false
    end
  end
end
