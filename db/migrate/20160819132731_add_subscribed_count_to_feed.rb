class AddSubscribedCountToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :subscribed_feeds_count, :integer
  end
end
