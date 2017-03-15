class Feed < ApplicationRecord
  has_many :entries
  has_many :subscribed_feeds, dependent: :destroy
  
  validates :name, :url, presence: true
  
  scope :unsubscribed, ->(subscribed_feeds) { where.not(id: subscribed_feeds.map(& :feed_id)) }
end
