class Feed < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :url
  has_many :entries
  has_many :subscribed_feeds
end
