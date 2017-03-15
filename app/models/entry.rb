class Entry < ApplicationRecord::Base
  belongs_to :feed, dependent: :destroy
  
  scope :user_entries, ->(subscribed_feeds) { where(feed_id: subscribed_feeds.map(& :feed_id)) }
end
