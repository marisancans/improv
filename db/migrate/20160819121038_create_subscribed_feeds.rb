class CreateSubscribedFeeds < ActiveRecord::Migration
  def change
    create_table :subscribed_feeds do |t|
      t.integer :user_id
      t.integer :feed_id

      t.timestamps null: false
    end
  end
end
