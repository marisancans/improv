class SubscribedFeed < ActiveRecord::Base
    belongs_to :feed, dependent: :destroy
    belongs_to :user, dependent: :destroy
    
    scope :subscribed, ->(user) { where(user: user) }
end
