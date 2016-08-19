class Feed < ActiveRecord::Base
  validates :name, presence: true
  validates :url, presence: true
  has_many :entries
  has_many :subscribed_feeds
  
  scope :unsubscribed, ->(user, subscribed_feeds) { where.not(id: subscribed_feeds.map{|n| n.feed.id}) }
end
