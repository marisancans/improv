class Feed < ActiveRecord::Base
  validates :name, presence: true
  validates :url, presence: true
  has_many :entries
  has_many :subscribed_feeds, dependent: :destroy
  
  scope :unsubscribed, ->(subscribed_feeds) { where.not(id: subscribed_feeds.map(& :feed_id)) }
end
