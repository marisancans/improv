class SubscribedFeed < ActiveRecord::Base
    belongs_to :feed, counter_cache: true
    belongs_to :user

    validates_uniqueness_of :feed_id, scope: :user_id, presence: true
    
    scope :subscribed, ->(user){ where(user_id: user.id ) }
end
