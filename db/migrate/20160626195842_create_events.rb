class CreateEvents < ActiveRecord::Migration

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer :user_id
  end
  
end
