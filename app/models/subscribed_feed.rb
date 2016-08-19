class SubscribedFeed < ActiveRecord::Base
    belongs_to :feed, dependent: :destroy, counter_cache: true
    belongs_to :user, dependent: :destroy
    
    scope :subscribed, ->(user) { where(user: user) }
end
