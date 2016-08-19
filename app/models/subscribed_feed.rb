class SubscribedFeed < ActiveRecord::Base
    belongs_to :feed, dependent: :destroy, counter_cache: true
    belongs_to :user, dependent: :destroy

    validates :feed_id, :user_id, presence: true, uniqueness: true
    
    scope :subscribed, ->(user) { where(user: user) }
end
